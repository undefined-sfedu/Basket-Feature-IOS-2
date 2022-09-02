//
//  LogInTableViewCell.swift
//  BasketFeature3.0
//
//  Created by Daniil on 02.09.2022.
//

import UIKit

class LogInTableViewCell: UITableViewCell {
    //MARK: - View:
    private var label: UILabel{
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        label.textAlignment = .center
        label.text = "Зарегистрироваться"
        label.textColor = .black
        label.font = UIFont(name: label.font.fontName, size: 30)
//        label.titleLabel?.font = UIFont(name: (button.titleLabel?.font.fontName)!, size: 30)
        label.backgroundColor = UIColor.customOrange
        label.layer.cornerRadius = 10
        return label
    }
    override func layoutSubviews() {
        self.contentView.layer.cornerRadius = 10
        self.contentView.addSubview(label)
    }

}
