//
//  AlreadyHaveAccountTableViewCell.swift
//  BasketFeature3.0
//
//  Created by Daniil on 02.09.2022.
//

import UIKit

class AlreadyHaveAccountTableViewCell: UITableViewCell {

    //MARK: - View:
    private var label: UILabel{
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        label.textAlignment = .center
        label.textColor = .black
        label.text = "Уже есть аккаунт"
//        let titleString = NSMutableAttributedString(string: "уже есть аккаунт")
//        titleString.addAttribute(
//            .underlineStyle,
//            value: NSUnderlineStyle.single.rawValue,
//            range: NSRange(location: 0, length: ("уже есть аккаунт").count)
//        )
//        label.setAttributedTitle(titleString, for: .normal)
        label.font = UIFont(name: "SF Pro", size: 20)
        
        return label
    }
    override func layoutSubviews() {
        
        self.contentView.addSubview(label)
    }

}
