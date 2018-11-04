//
//  AutoCompletePersonViewController.swift
//  AutoCompleteTextField
//
//  Created by Tim Beals on 2018-11-02.
//  Copyright © 2018 Roobi Creative. All rights reserved.
//

import UIKit

class AutoCompletePersonViewController: UIViewController {
    
    var autoCompletePerson: AutoCompletePerson?
    
    var selection: Person? {
        didSet {
            print("SELECTION IS: \(String(describing: selection))")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
    }
    
    override func viewWillLayoutSubviews() {
        layoutAutocompletePerson()
    }
    
}

//MARK: Layout methods
extension AutoCompletePersonViewController {
    
    private func layoutAutocompletePerson() {
        
        if let acp = autoCompletePerson {
            acp.removeFromSuperview()
        }
        
        let height: CGFloat = 160.0
        let acpFrame = CGRect(x: Layout.pad.rawValue,
                              y: (self.view.frame.maxY / 4),
                              width: self.view.bounds.width - (2 * Layout.pad.rawValue),
                              height: height)
        
        autoCompletePerson = AutoCompletePerson(frame: acpFrame)
        view.addSubview(autoCompletePerson!)
        autoCompletePerson?.delegate = self
        autoCompletePerson?.setPersonDatasource(Person.PersonData.allPeople())
    }
    
}

//MARK: AutoCompletePersonDelegate methods
extension AutoCompletePersonViewController : AutoCompletePersonDelegate {
    
    func selectedPerson(_ person: Person?) {
        self.selection = person
    }
}
