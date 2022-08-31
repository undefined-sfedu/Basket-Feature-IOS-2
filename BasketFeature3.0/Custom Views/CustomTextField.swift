//
//  CustomTextField.swift
//  BasketFeature3.0
//
//  Created by Daniil on 31.08.2022.
//

import Foundation
import UIKit
class CustomTextField: UITextField{
    // MARK: - Properties
    private var textPadding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    
    // MARK: - Methods
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }

}
