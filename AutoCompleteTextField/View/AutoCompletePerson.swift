//
//  AutoCompletePerson.swift
//  AutoCompleteTextField
//
//  Created by Tim Beals on 2018-11-02.
//  Copyright © 2018 Roobi Creative. All rights reserved.
//

import UIKit

protocol AutoCompletePersonDelegate {
    func selectedPerson(_ person: Person?)
}

class AutoCompletePerson: UIView {
    
    let profileImage: UIImageView = {
        let imageView = UIImageView(image: UIImage.Theme.defaultProfile.image)
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    lazy var autoCompleteTextfield: AutoCompleteTextField = {
        let autoComplete = AutoCompleteTextField()
        autoComplete.font = UIFont.Theme.mediumText.font
        autoComplete.placeholder = "Person's name"
        autoComplete.tintColor = UIColor.gray
        autoComplete.boldTextColor = UIColor.black
        autoComplete.highlightTextColor = UIColor.gray
        autoComplete.autocompleteDelegate = self
        return autoComplete
    }()
    
    let underlineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black
        return view
    }()
    
    private var personDatasource: [String: Person]? {
        didSet {
            setAutoCompleteTextFieldDatasource()
        }
    }
    
    private var autoCompleteDatasource: [String]?
    
    private var selectedPerson: Person? {
        didSet {
            self.delegate?.selectedPerson(selectedPerson)
        }
    }
    
    var delegate: AutoCompletePersonDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension AutoCompletePerson {
    
    private func setupViews() {
        
        addSubview(profileImage)
        profileImage.frame = CGRect(x: 0, y: 0, width: self.bounds.height, height: self.bounds.height)
        profileImage.layer.cornerRadius = profileImage.frame.width / 2
        
        addSubview(autoCompleteTextfield)
        autoCompleteTextfield.frame = CGRect(x: profileImage.frame.width + Layout.pad.rawValue, y: self.bounds.height / 2 - 11, width: self.bounds.width - profileImage.frame.width - Layout.pad.rawValue, height: 22)
        
        addSubview(underlineView)
        underlineView.frame = CGRect(x: autoCompleteTextfield.frame.origin.x, y: autoCompleteTextfield.frame.maxY + 4, width: autoCompleteTextfield.frame.width, height: 2)
    }

}

//MARK: prepare data for autocomplete textfield
extension AutoCompletePerson {
    
    func setPersonDatasource(_ input: [Person]) {
        var data = [String: Person]()
        
        for person in input {
            data["\(person.fullName)"] = person
        }
        self.personDatasource = data
    }
    
    private func setAutoCompleteTextFieldDatasource() {
        
        guard let personData = self.personDatasource else {
            self.autoCompleteDatasource = nil
            return
        }
        
        self.autoCompleteDatasource = Array(personData.keys)
    }
}

//MARK: AutoCompleteTextFieldDelegate
extension AutoCompletePerson: AutoCompleteTextFieldDelegate {
    
    func provideDatasource() {
        autoCompleteTextfield.datasource = autoCompleteDatasource
    }

    func returned(with selection: String) {
        guard let data = self.personDatasource else { return }
        
        if let person = data[selection] {
            self.profileImage.image = person.profileImage
            self.selectedPerson = person
        }
    }

    func textFieldCleared() {
        self.profileImage.image = UIImage.Theme.defaultProfile.image
        self.selectedPerson = nil
    }
    
}
