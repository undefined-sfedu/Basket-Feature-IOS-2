//
//  LogInView.swift
//  BasketFeature3.0
//
//  Created by Daniil on 08.09.2022.
//

import UIKit

class LogInView: UIViewController, UITextFieldDelegate {
    //MARK: - Properties
    private var presenter: LoginPresenter = .init()
    
    
    
    //MARK: - Views
    private var scrollView = UIScrollView()
    
    private var imageView: UIImageView = {
        let view = UIImageView()
//        let size = self.view.frame.size
//        view.frame = CGRect(x: 0, y: 0,
//                            width: size.width,
//                            height: size.width * 0.428)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "logo")
        
        
        return view
        
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
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
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
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        return label
    }()
    
    private let forgetPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitle("забыл пароль", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let enterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = UIColor.customOrange
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont(name: button.titleLabel!.font.fontName, size: 30)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let logInButton: UIButton = {
        let button = UIButton()
        button.setTitle("зарегистрироваться", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setAppearance()
    }
    
    // MARK: - TextFieldDelegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.textColor = .customOrange
        textField.layer.borderColor = UIColor.customOrange.cgColor
        
        if textField == emailTextField{
            errorUnderEmailLabel.isHidden = true
        }
        
        else if textField == passwordTextField{
            errorUnderPasswordLabel.isHidden = true
        }
        
    }
    
     func textFieldDidEndEditing(_ textField: UITextField) {
        textField.textColor = .black
        textField.layer.borderColor = UIColor.customBorderColor.cgColor
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
    // MARK: - Methods For Presenter
    func changeVisibleOfErrorFields(typeOfLabel: LoginPresenter.TypeError, visible: Bool){
        
        var errorLabel = UILabel()
        var textField = CustomTextField()
        switch typeOfLabel{
        case .emailError:
            errorLabel = errorUnderEmailLabel
            textField = emailTextField
            
        case .passwordError:
            errorLabel = errorUnderPasswordLabel
            textField = passwordTextField

        }
        
        errorLabel.isHidden = !visible
        textField.textColor = visible ? (.red) : (.black)
        textField.layer.borderColor = (visible ? (UIColor.red.cgColor) : (UIColor.customBorderColor.cgColor))
    }

}

private extension LogInView{
    
    // MARK: - OBJC Methods
    @objc func keyboardWillShow(notification: Notification) {
        let userInfo:NSDictionary = notification.userInfo! as NSDictionary
        let keyboardFrame:NSValue = userInfo.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue
        let keyboardRectangle = keyboardFrame.cgRectValue
        let keyboardHeight = keyboardRectangle.height
        let size = self.view.frame.size
        scrollView.contentSize = CGSize(width: size.width, height: size.height + keyboardHeight * 0.7)
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        scrollView.contentSize = CGSize(width: 0, height: 0)
    }
    
    @objc func forgetPasswordAction(_ sender: UIButton) {
        navigationController?.pushViewController(ForgetPasswordView(), animated: true)
    }
    
    @objc func enterButtonAction(_ sender: UIButton) {
        presenter.enter()
    }
    
    @objc func logInAction(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        
        
    }
    
    // MARK: - Private Methods
    func setAppearance(){
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        self.presenter.accessView = self
        
        setScrollView()
        setConstraints()
        setObserversForKeyboard()
        setButtonsActoin()
    }
    
    
    func setButtonsActoin(){
        forgetPasswordButton.addTarget(self, action: #selector(forgetPasswordAction(_:)), for: .touchDown)
        enterButton.addTarget(self, action: #selector(enterButtonAction(_:)), for: .touchDown)
        logInButton.addTarget(self, action: #selector(logInAction(_:)), for: .touchDown)
    }
    
    func setObserversForKeyboard(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func setScrollView(){
        view.addSubview(scrollView)
        
        let size = self.view.frame.size
        scrollView.frame = CGRect(x: 0, y: 0,
                                  width: size.width,
                                  height: size.height)
        scrollView.contentSize = scrollView.frame.size
        scrollView.showsVerticalScrollIndicator = false
        
        [imageView, emailTextField, errorUnderEmailLabel, passwordTextField, errorUnderPasswordLabel, forgetPasswordButton, enterButton, logInButton].forEach { item in
            scrollView.addSubview(item)
        }
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            imageView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            imageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.428)
        ])
        
        NSLayoutConstraint.activate([
            emailTextField.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: scrollView.frame.width * 0.074),
            emailTextField.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.853),
            emailTextField.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: scrollView.frame.height * 0.016),
            emailTextField.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.089)
        ])
        
        NSLayoutConstraint.activate([
            errorUnderEmailLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: scrollView.frame.width * 0.12),
            errorUnderEmailLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.586),
            errorUnderEmailLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor),
            errorUnderEmailLabel.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.034)
        ])
        
        NSLayoutConstraint.activate([
            passwordTextField.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: scrollView.frame.width * 0.074),
            passwordTextField.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.853),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: scrollView.frame.height * 0.047),
            passwordTextField.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.089)
        ])
        
        NSLayoutConstraint.activate([
            errorUnderPasswordLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: scrollView.frame.width * 0.12),
            errorUnderPasswordLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.586),
            errorUnderPasswordLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor),
            errorUnderPasswordLabel.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.034)
        ])
        
        NSLayoutConstraint.activate([
            forgetPasswordButton.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: scrollView.frame.width * 0.202),
            forgetPasswordButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.586),
            forgetPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: scrollView.frame.height * 0.032),
            forgetPasswordButton.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.034)
        ])
     
        NSLayoutConstraint.activate([
            enterButton.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: scrollView.frame.width * 0.074),
            enterButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.853),
            enterButton.topAnchor.constraint(equalTo: forgetPasswordButton.bottomAnchor, constant: scrollView.frame.height * 0.01),
            enterButton.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.104)
        ])
        
        NSLayoutConstraint.activate([
            logInButton.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: scrollView.frame.width * 0.208),
            logInButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.586),
            logInButton.topAnchor.constraint(equalTo: enterButton.bottomAnchor, constant: scrollView.frame.height * 0.01),
            logInButton.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.034)
        ])
    }
}
