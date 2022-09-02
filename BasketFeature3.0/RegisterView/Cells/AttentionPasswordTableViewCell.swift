//
//  AttentionPasswordTableViewCell.swift
//  BasketFeature3.0
//
//  Created by Daniil on 02.09.2022.
//

import UIKit

class AttentionPasswordTableViewCell: UITableViewCell {
    //MARK: - Properties
    var title = ""{
        didSet{
            label.text = title
        }
    }
    
    //MARK: - View
    private var label: UILabel{
        let label = UILabel()
        label.numberOfLines = 3
        label.frame = CGRect(x: 0, y: 0,
                             width: self.frame.width * 0.9,
                             height: self.frame.height * 0.869)
        label.text = title
        return label
    }
    
    override func layoutSubviews() {
        self.contentView.addSubview(label)
    }
    

}
