//
//  ForgetPasswordView.swift
//  BasketFeature3.0
//
//  Created by Daniil on 14.09.2022.
//

import UIKit

class ForgetPasswordView: UIViewController {
    
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        setAppearance()
        
    }
    
    
    // MARK: - Views
    private var imageView: UIImageView{
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.frame = CGRect(x: 0, y: view.frame.size.height * 0.05,
                                 width: view.frame.size.width,
                                 height: view.frame.size.height * 0.428)
        return imageView
    }
    
    private var scrollView = UIScrollView()
    
    private var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "Восстановить пароль"
        label.font = UIFont(name: label.font.fontName, size: 29)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var smallLabel: UILabel = {
        let label = UILabel()
        label.text = "к какой почте привязан ваш аккаунт?"
        label.font = UIFont(name: label.font.fontName, size: 20)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var textField: CustomTextField  = {
        let field = CustomTextField()
        field.placeholder = "Электронная почта"
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.customBorderColor.cgColor
        field.translatesAutoresizingMaskIntoConstraints = false
        field.layer.cornerRadius = 10
        return field
    }()
    
    private var errorLabel: UILabel = {
        let label = UILabel()
        label.text = "бе бе бе данной почте"
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var timerLabel: UILabel = {
        let label = UILabel()
        label.text = "повторный код через 0:15"
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = .customBorderColor
        label.font = UIFont(name: label.font.fontName, size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var button: UIButton = {
        let button = UIButton()
        button.setTitle("Подтвердить", for: .normal)
        button.backgroundColor = .customOrange
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont(name: button.titleLabel!.font.fontName, size: 30)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
}

private extension ForgetPasswordView{
    func setAppearance(){
        self.view.backgroundColor = .white
        
        [imageView, scrollView].forEach { item in
            view.addSubview(item)
        }
        
        [mainLabel, smallLabel, textField, errorLabel, timerLabel, button].forEach { item in
            self.scrollView.addSubview(item)
        }
        
        
        setScrollView()
        setConstrains()
        print("height of view is \(self.view.frame.height)")
    }
    
    func setScrollView(){
        let size = view.frame.size
        scrollView.frame = CGRect(x: 0, y: size.height * 0.29,
                                  width: size.width,
                                  height: size.height * 0.7)
        scrollView.backgroundColor = .white
        scrollView.layer.cornerRadius = 20
        scrollView.showsVerticalScrollIndicator = false
    }
    
    func setConstrains(){
        NSLayoutConstraint.activate([
            
            mainLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: scrollView.frame.height * 0.04),
            mainLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: scrollView.frame.width * 0.074),
            mainLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.533),
            mainLabel.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.143)
        ])
        
        NSLayoutConstraint.activate([
            smallLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: scrollView.frame.height * 0.066),
            smallLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: scrollView.frame.width * 0.074),
            smallLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.666),
            smallLabel.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.074)
        ])
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: smallLabel.bottomAnchor, constant: scrollView.frame.height * 0.092),
            
            textField.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: scrollView.frame.width * 0.074),
            textField.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.853),
            textField.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.128)
        ])
        
        NSLayoutConstraint.activate([
            errorLabel.topAnchor.constraint(equalTo: textField.bottomAnchor),
            errorLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: scrollView.frame.width * 0.12),
            errorLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.586),
            errorLabel.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.049)
        ])
        
        NSLayoutConstraint.activate([
            timerLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: scrollView.frame.height * 0.087),
            timerLabel.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: scrollView.frame.width * 0.098),
            timerLabel.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.802),
            timerLabel.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.077)
        ])
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: scrollView.frame.height * 0.199),
            button.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: scrollView.frame.width * 0.074),
            button.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.853),
            button.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 0.149)
        ])
        
    }
    
    
    
    
}
