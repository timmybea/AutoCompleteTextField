//
//  UIFont_Extension.swift
//  AutoCompleteTextField
//
//  Created by Tim Beals on 2018-11-02.
//  Copyright © 2018 Roobi Creative. All rights reserved.
//

import UIKit

extension UIFont {
    
    enum Theme {
        case mediumText
        
        var font: UIFont {
            switch self {
            case .mediumText:
                return UIFont.systemFont(ofSize: 18, weight: .medium)
            }
        }
    }
}
