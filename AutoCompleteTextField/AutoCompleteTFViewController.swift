//
//  ViewController.swift
//  AutoCompleteTextField
//
//  Created by Tim Beals on 2018-11-02.
//  Copyright © 2018 Roobi Creative. All rights reserved.
//

import UIKit

class AutoCompleteTFViewController: UIViewController {
    
    var autoCompleteTextField: AutoCompleteTextField = {
        let textfield = AutoCompleteTextField()
        textfield.font = UIFont.Theme.mediumText.font
        textfield.placeholder = "Person's name"
        textfield.tintColor = UIColor.gray
        textfield.boldTextColor = UIColor.black
        textfield.lightTextColor = UIColor.gray
        return textfield
    }()
    
    var selection: String? {
        didSet {
            print("SELECTION IS: \(String(describing: selection))")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
 
        self.view.backgroundColor = UIColor.white
    }
    
    override func viewWillLayoutSubviews() {
        
        layoutAutocompleteTextField()
    }

}

//MARK: Layout methods
extension AutoCompleteTFViewController {
    
    private func layoutAutocompleteTextField() {
        autoCompleteTextField.removeFromSuperview()
        
        let height: CGFloat = 22.0
        autoCompleteTextField.frame = CGRect(x: Layout.pad.rawValue,
                                             y: view.bounds.maxY / 2 - (height / 2),
                                             width: view.bounds.width - (Layout.pad.rawValue * 2),
                                             height: height)
        view.addSubview(autoCompleteTextField)
        autoCompleteTextField.autocompleteDelegate = self
    }
}

//MARK: AutoCompleteTextFieldDelegate
extension AutoCompleteTFViewController: AutoCompleteTextFieldDelegate {

    func provideDatasource() {
        let datasource = ["Jon Snow", "Daenerys Targaryen", "Gregor Clegane", "Cersei Lannister", "Tyrion Lannister", "Joffrey Baratheon", "Sandor Clegane", "Sansa Stark"]
        autoCompleteTextField.datasource = datasource
    }

    func returned(with selection: String) {
        self.selection = selection
    }

    func textFieldCleared() {
        self.selection = nil
    }

}

