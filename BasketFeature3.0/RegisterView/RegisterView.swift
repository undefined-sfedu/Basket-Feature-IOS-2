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
    
    private enum TypeOfCellByNum: Int{
        case loginTextField = 0
        case attentionAboutPassword
        case passwordTextField
        case repeatPasswordTextField
        case logInButton
        case haveAccount
    }
    //MARK: - Views
    private var tableView: UITableView{
        let table = UITableView(frame: self.view.frame, style: .insetGrouped)

        table.backgroundColor = colorOfUnderViews
        table.delegate = self
        table.dataSource = self
        table.register(TextFieldTableViewCell.self, forCellReuseIdentifier: "\(TextFieldTableViewCell.self)")
        table.register(AttentionPasswordTableViewCell.self, forCellReuseIdentifier: "\(AttentionPasswordTableViewCell.self)")
        table.register(LogInTableViewCell.self, forCellReuseIdentifier: "\(LogInTableViewCell.self)")
        table.register(AlreadyHaveAccountTableViewCell.self, forCellReuseIdentifier: "\(AlreadyHaveAccountTableViewCell.self)")
        
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
        view.addSubview(tableView)
//        getTextFields().forEach { item in
//            view.addSubview(item)
//        }
//
//        [attentionPassword, registerButton, haveAccountButton].forEach { item in
//            view.addSubview(item)
//        }
        
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
        var cell = UITableViewCell()
        switch indexPath.row{
        case TypeOfCellByNum.loginTextField.rawValue:
            cell = tableView.dequeueReusableCell(withIdentifier: "\(TextFieldTableViewCell.self)", for: indexPath)
            if let newCell = cell as? TextFieldTableViewCell{
                newCell.placeholder = "Электронная почта"
                newCell.errorTitle = "something"
                
            }
            break
            
        case TypeOfCellByNum.attentionAboutPassword.rawValue:
            cell = tableView.dequeueReusableCell(withIdentifier: "\(AttentionPasswordTableViewCell.self)", for: indexPath)
            if let newCell = cell as? AttentionPasswordTableViewCell{
                newCell.title = "Пароль должен содержать минимум 8 символов латинскими буквами, а также хотя бы одну цифру"
                
                
            }
            break
            
        case TypeOfCellByNum.passwordTextField.rawValue:
            cell = tableView.dequeueReusableCell(withIdentifier: "\(TextFieldTableViewCell.self)", for: indexPath)
            if let newCell = cell as? TextFieldTableViewCell{
                newCell.placeholder = "Пароль"
                newCell.errorTitle = "something"
                
            }
            break
            
        case TypeOfCellByNum.repeatPasswordTextField.rawValue:
            cell = tableView.dequeueReusableCell(withIdentifier: "\(TextFieldTableViewCell.self)", for: indexPath)
            if let newCell = cell as? TextFieldTableViewCell{
                newCell.placeholder = "Повторите пароль"
                newCell.errorTitle = "something"
                
            }
            
        case TypeOfCellByNum.logInButton.rawValue:
            cell = tableView.dequeueReusableCell(withIdentifier: "\(LogInTableViewCell.self)", for: indexPath)
            
            break
            
        case TypeOfCellByNum.haveAccount.rawValue:
            cell = tableView.dequeueReusableCell(withIdentifier: "\(AlreadyHaveAccountTableViewCell.self)", for: indexPath)
            
            break
        default:
            print("\(RegisterView.self): Check cellForRowAt method")
            break
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        size.height * 0.124
        var res: CGFloat = self.view.frame.height
        switch indexPath.row{
            
        case TypeOfCellByNum.loginTextField.rawValue, TypeOfCellByNum.passwordTextField.rawValue, TypeOfCellByNum.repeatPasswordTextField.rawValue :
            res *= 0.124
            break
            
        case TypeOfCellByNum.attentionAboutPassword.rawValue:
            res *= 0.103
            break
        
            
        case TypeOfCellByNum.logInButton.rawValue:
            res *= 0.105
            break
            
        case TypeOfCellByNum.haveAccount.rawValue:
            res *= 0.061
            break
            
        default:
            res = 0.034
            break
        
        }
        return res
    }
    

}
