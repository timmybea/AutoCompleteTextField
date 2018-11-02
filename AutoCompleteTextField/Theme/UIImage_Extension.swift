//
//  UIImage_Extension.swift
//  AutoCompleteTextField
//
//  Created by Tim Beals on 2018-11-02.
//  Copyright © 2018 Roobi Creative. All rights reserved.
//

import UIKit

extension UIImage {
    
    enum Theme {
        case defaultProfile
        
        var name: String {
            switch  self {
            case .defaultProfile:
                return "defaultProfile"
            }
        }
            
        var image: UIImage {
            switch self {
            case .defaultProfile:
                return UIImage(named: self.name)!
            }
        }
    }
    
}
