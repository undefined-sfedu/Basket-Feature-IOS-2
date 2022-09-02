//
//  TextFieldTableViewCell.swift
//  BasketFeature3.0
//
//  Created by Daniil on 01.09.2022.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell {
    //MARK: - Properties
    var placeholder: String = ""{
        didSet{
            textField.placeholder = placeholder
            
        }
    }
    
    var errorTitle: String = ""{
        didSet{
            errorLabel.text = "*" + errorTitle
            errorLabel.isHidden = ((errorTitle == "") ? true : false)
            
        }
    }
    
    var textOfField: String{
        get{
            if let text = textField.text{
                return text
            }
            return "\(self):CHECK CORRECT WORK IN TEXT FIELD"
        }
    }
    //MARK: - Views
    private var textField: CustomTextField{
        let field = CustomTextField()
        field.frame = CGRect(x: 0, y: 0,
                             width: self.frame.width,
                             height: self.frame.height * 0.722)
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.customBorderColor.cgColor
        field.placeholder = placeholder
        return field
    }
    
    private var errorLabel: UILabel{
        let label = UILabel()
        label.frame = CGRect(x: self.frame.width * 0.053,
                             y: textField.frame.height,
                             width: self.frame.width * 0.687,
                             height: self.frame.height * 0.277)
        label.textColor = .customOrange
        label.text = errorTitle
//        label.isHidden = true
        
        return label
    }
    
    //MARK: - UiTableViewCell
    override func layoutSubviews() {
//        print(textField.placeholder)
//        print(errorLabel.text)
        self.contentView.addSubview(textField)
        self.contentView.addSubview(errorLabel)
        
    }
}
