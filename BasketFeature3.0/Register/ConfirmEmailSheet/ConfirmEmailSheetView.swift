//
//  ConfirmEmailSheetView.swift
//  BasketFeature3.0
//
//  Created by Daniil on 07.09.2022.
//

import UIKit

class ConfirmEmailSheetView: UIViewController {
    // MARK: - Properties
    var customParent: RegisterView? = nil
    private var multiplier = 0.5
    private var confiirmEmailLabel: UILabel  {
        let label = UILabel()
        label.text = "Подтверждение почты"
        label.numberOfLines = 2
        label.font = UIFont(name: label.font.fontName, size: 29)
        label.textColor = .black
        let size = self.view.bounds.size
        label.frame = CGRect(x: size.width * 0.074,
                             y: size.height * 0.052 * multiplier,
                             width: size.width * 0.672,
                             height: size.height * 0.16 * multiplier)
        return label
    }
    
    private var titleLabel: UILabel  {
        let label = UILabel()
        label.text = "Вам на почту был отправлена ссылка для подтверждения. Пройдите по ссылке, чтобы активировать ваш аккаунт."
        label.textColor = .black
        label.numberOfLines = 4
        label.font = UIFont(name: label.font.fontName, size: 20)
        let size = self.view.bounds.size
        label.frame = CGRect(x: size.width * 0.072,
                             y: size.height * multiplier * 0.285,
                             width: size.width * 0.752,
                             height: size.height * 0.235 * multiplier)
        return label
    }
    
    private var errorLabel: UILabel  {
        let label = UILabel()
        label.text = "*аккаунт не подтвержден, пройдите по ссылке в письме"
        label.textColor = .black
        label.numberOfLines = 4
        label.font = UIFont(name: label.font.fontName, size: 20)
        let size = self.view.bounds.size
        label.textColor = .red
        label.frame = CGRect(x: size.width * 0.072,
                             y: size.height * multiplier * 0.515,
                             width: size.width * 0.752,
                             height: size.height * 0.235 * multiplier)
        return label
    }
    
    private var confirmButton: UIButton{
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .customOrange
        button.layer.cornerRadius = 10
        button.setTitle("Подтвердить", for: .normal)
        let size = self.view.bounds.size
        button.frame = CGRect(x: size.width * 0.074,
                             y: size.height * 0.75 * multiplier,
                             width: size.width * 0.853,
                              height: size.height * 0.175 * multiplier)
        button.addTarget(self, action: #selector(buttonAction(_:)), for: .touchDown)
        return button
    }
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setAppearance()
        
    }
}

private extension ConfirmEmailSheetView{
    func setAppearance(){
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        [confiirmEmailLabel, titleLabel, confirmButton, errorLabel].forEach { item in
            self.view.addSubview(item)
        }
        
    }
    
    @objc func buttonAction(_ sender: UIButton){
        if let aliveParent = customParent{
            aliveParent.goToNextView()
            self.dismiss(animated: false)
        }
    }
}
