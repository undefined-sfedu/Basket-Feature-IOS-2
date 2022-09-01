//
//  RegisterView.swift
//  BasketFeature3.0
//
//  Created by Daniil on 30.08.2022.
//

import UIKit

class RegisterView: UIViewController {
    
    //MARK: - Properties
    private var colorOfUnderViews = UIColor.white
    private var size: CGSize{
        return view.frame.size
    }
    //MARK: - Views
    private var tableView: UITableView{
        let table = UITableView(frame: self.view.frame, style: .insetGrouped)
        table.backgroundColor = colorOfUnderViews
        table.delegate = self
        table.dataSource = self
        table.register(TextFieldTableViewCell.self, forCellReuseIdentifier: "\(TextFieldTableViewCell.self)")
        
        return table
    }
    private var emailTextField = CustomTextField()
    private var passwordTextField = CustomTextField()
    private var repeatPasswordTextField = CustomTextField()
    private var attentionPassword: UILabel{
        let label = UILabel()
        label.text = "Пароль должен содержать минимум 8 символов латинскими буквами, а также хотя бы одну цифру"
        label.font = UIFont(name: label.font.fontName, size: 14)
        label.numberOfLines = 0
        
        label.frame.size = CGSize(width: size.width * 0.768, height: size.height * 0.103)
        label.frame.origin = CGPoint(x: size.width * 0.074, y: size.height * 0.321)
        return label
    }
    private var registerButton: UIButton{
        let button = UIButton()
        button.frame.size = CGSize(width: size.width * 0.853, height: size.height * 0.104)
        button.frame.origin = CGPoint(x: size.width * 0.074, y: size.height * 0.769)
        button.setTitle("Зарегистрироваться", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: (button.titleLabel?.font.fontName)!, size: 30)
        button.backgroundColor = UIColor.customOrange
        button.layer.cornerRadius = 10
        return button
    }
    
    private var haveAccountButton: UIButton{
        let button = UIButton()
        
        button.frame.size = CGSize(width: size.width * 0.586, height: size.height * 0.034)
        button.frame.origin = CGPoint(x: size.width * 0.208, y: size.height * 0.896)
        //        button.setTitle("уже есть аккаунт", for: .normal)
        button.setTitleColor(.black, for: .normal)
        let titleString = NSMutableAttributedString(string: "уже есть аккаунт")
        titleString.addAttribute(
            .underlineStyle,
            value: NSUnderlineStyle.single.rawValue,
            range: NSRange(location: 0, length: ("уже есть аккаунт").count)
        )
        button.setAttributedTitle(titleString, for: .normal)
        button.titleLabel?.font = UIFont(name: "SF Pro", size: 20)
        return button
    }
    
    //MARK: - Methods
    
    
    
    //MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        setAppearance()
    }
  
}
//MARK: - Private Methods
private extension RegisterView{
    func setAppearance(){
        view.backgroundColor = .white
        title = "Регистрация"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        getTextFields().forEach { item in
            view.addSubview(item)
        }
        
        [attentionPassword, registerButton, haveAccountButton].forEach { item in
            view.addSubview(item)
        }
        
    }
    
    func getTextFields() -> [CustomTextField]{
        var res = [CustomTextField]()
        var views = [emailTextField, passwordTextField, repeatPasswordTextField]
        
        views.forEach { item in
            res.append(setTextField(textField: item))
        }
        
        let size = self.view.frame.size
        let preference = [
            ("Электронная почта", CGPoint(x: size.width * 0.074, y: size.height * 0.211)),
            ("Пароль", CGPoint(x: size.width * 0.074, y: size.height * 0.436)),
            ("Повторите пароль", CGPoint(x: size.width * 0.074, y: size.height * 0.581))
        ]
        for i in 0...res.count-1{
            
            res[i].placeholder = preference[i].0
            res[i].frame.origin = preference[i].1
        }
        
        for i in 0...res.count - 1{
            views[i] = res[i]
        }
        return res
    }
    
    func setTextField(textField: CustomTextField) -> CustomTextField{
        let field = CustomTextField()
        
        field.frame.size = CGSize(width: size.width * 0.853, height: size.height * 0.089)
        
        field.layer.cornerRadius = 12
        
        field.layer.borderWidth = 1
        field.layer.borderColor = CGColor(red: 174/255, green: 174/255, blue: 174/255, alpha: 1)
        return field
    }
}
//MARK: - TableView
extension RegisterView: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
