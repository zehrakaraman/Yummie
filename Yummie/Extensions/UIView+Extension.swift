//
//  UIView+Extension.swift
//  Yummie
//
//  Created by Zehra on 20.09.2022.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
