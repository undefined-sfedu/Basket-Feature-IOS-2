//
//  RegisterView3.swift
//  BasketFeature3.0
//
//  Created by Daniil on 06.09.2022.
//

import UIKit

class RegisterView: UIViewController, UITextFieldDelegate {
    
    // MARK: - Views
    private var scrollView = UIScrollView()
    
    private let registrationLabel: UILabel = {
        let label = UILabel()
        label.text = "Регистрация"
        label.textAlignment = .center
        label.font = UIFont(name: label.font.fontName, size: 30)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var emailTextField: CustomTextField = {
        let field = CustomTextField()
        field.placeholder = "Электронная почта"
        field.layer.borderColor = UIColor.customBorderColor.cgColor
        field.layer.borderWidth = 1
        field.layer.cornerRadius = 10
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private let errorUnderEmailLabel: UILabel = {
        let label = UILabel()
        label.text = "*неверный формат"
        label.numberOfLines = 0
        label.textColor = .customOrange
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let attentionLabel: UILabel = {
        let label = UILabel()
        label.text = "Пароль должен содержать минимум 8 символов латинскими буквами, а также хотя бы одну цифру"
        label.numberOfLines = 0
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let passwordTextField: CustomTextField = {
        let field = CustomTextField()
        field.placeholder = "Пароль"
        field.layer.borderColor = UIColor.customBorderColor.cgColor
        field.layer.borderWidth = 1
        field.layer.cornerRadius = 10
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private let errorUnderPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "*неверный формат"
        label.numberOfLines = 0
        label.textColor = .customOrange
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let repeatPasswordTextField: CustomTextField = {
        let field = CustomTextField()
        field.placeholder = "Повторите пароль"
        field.layer.borderColor = UIColor.customBorderColor.cgColor
        field.layer.borderWidth = 1
        field.layer.cornerRadius = 10
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private let errorUnderRepeatPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "*пароли не совпадают"
        label.numberOfLines = 0
        label.textColor = .customOrange
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let logInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Зарегистрироваться", for: .normal)
        button.backgroundColor = UIColor.customOrange
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont(name: button.titleLabel!.font.fontName, size: 30)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let haveAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("уже есть аккаунт", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAppearance()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let size = self.view.frame.size
        scrollView.contentSize = CGSize(width: size.width, height: size.height * 1.15)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let size = self.view.frame.size
        scrollView.contentSize = CGSize(width: size.width, height: size.height)
        view.endEditing(true)
        return true
    }
    
    
}

// MARK: - Private Methods
private extension RegisterView{
    func setAppearance(){
        view.backgroundColor = .white
        [emailTextField, passwordTextField, repeatPasswordTextField].forEach { item in
            item.delegate = self
        }
        setScrollView()
        setConstrains()
    }
    func setScrollView(){
        
        let size = self.view.frame.size
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        scrollView.backgroundColor = .white
        scrollView.showsVerticalScrollIndicator = false
//        scrollView.contentSize = CGSize(width: size.width, height: size.height * 1.15)
        
        view.addSubview(scrollView)
        
        [registrationLabel, emailTextField, errorUnderEmailLabel, attentionLabel, passwordTextField, errorUnderPasswordLabel, repeatPasswordTextField, errorUnderRepeatPasswordLabel, logInButton, haveAccountButton].forEach { item in
            scrollView.addSubview(item)
        }
    }
    
    func setConstrains(){
        NSLayoutConstraint.activate([
            registrationLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 0.053),
            registrationLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.496),
            registrationLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0.029),
            registrationLabel.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.053)
        ])
        
        NSLayoutConstraint.activate([
            emailTextField.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: scrollView.frame.width * 0.074),
            emailTextField.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.853),
            emailTextField.topAnchor.constraint(equalTo: registrationLabel.bottomAnchor, constant: scrollView.frame.height * 0.047),
            emailTextField.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.089)
        ])
        
        NSLayoutConstraint.activate([
            errorUnderEmailLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: scrollView.frame.width * 0.12),
            errorUnderEmailLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.586),
            errorUnderEmailLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor),
            errorUnderEmailLabel.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.034)
        ])
        
        NSLayoutConstraint.activate([
            attentionLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: scrollView.frame.width * 0.074),
            attentionLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.768),
            attentionLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: scrollView.frame.height * 0.025),
            attentionLabel.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.103)
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: scrollView.frame.width * 0.074),
            passwordTextField.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.853),
            passwordTextField.topAnchor.constraint(equalTo: attentionLabel.bottomAnchor, constant: scrollView.frame.height * 0.005),
            passwordTextField.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.089)
        ])
        
        NSLayoutConstraint.activate([
            errorUnderPasswordLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: scrollView.frame.width * 0.12),
            errorUnderPasswordLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.586),
            errorUnderPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor),
            errorUnderPasswordLabel.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.034)
        ])
        
        NSLayoutConstraint.activate([
            repeatPasswordTextField.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: scrollView.frame.width * 0.074),
            repeatPasswordTextField.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.853),
            repeatPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: scrollView.frame.height * 0.055),
            repeatPasswordTextField.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.089)
        ])
        
        NSLayoutConstraint.activate([
            errorUnderRepeatPasswordLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: scrollView.frame.width * 0.12),
            errorUnderRepeatPasswordLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.586),
            errorUnderRepeatPasswordLabel.topAnchor.constraint(equalTo: repeatPasswordTextField.bottomAnchor),
            errorUnderRepeatPasswordLabel.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.034)
        ])
        
        NSLayoutConstraint.activate([
            logInButton.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: scrollView.frame.width * 0.074),
            logInButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.853),
            logInButton.topAnchor.constraint(equalTo: repeatPasswordTextField.bottomAnchor, constant: scrollView.frame.height * 0.097),
            logInButton.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.104)
        ])
        
        NSLayoutConstraint.activate([
            haveAccountButton.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: scrollView.frame.width * 0.208),
            haveAccountButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.586),
            haveAccountButton.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: scrollView.frame.height * 0.022),
            haveAccountButton.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.034)
        ])
    }
}
