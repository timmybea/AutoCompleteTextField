//
//  Person.swift
//  AutoCompleteTextField
//
//  Created by Tim Beals on 2018-11-02.
//  Copyright © 2018 Roobi Creative. All rights reserved.
//

import UIKit

class Person {
    
    var firstName: String
    var lastName: String
    var profileImage: UIImage?
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    init(firstName: String, lastName: String, profileImage: UIImage?) {
        self.firstName = firstName
        self.lastName = lastName
        self.profileImage = profileImage
    }
    
}

//MARK: Custom String Convertible
extension Person : CustomStringConvertible {
    
    var description: String {
        return "Person called \(fullName)"
    }
    
}

//MARK: Datasource
extension Person {
    
    enum PersonData {
        
        case jon
        case daenerys
        case gregor
        case cersei
        case tyrion
        case joffrey
        case sandor
        case sansa
        
        var firstName: String {
            switch self {
            case .jon: return "Jon"
            case .daenerys: return "Daenerys"
            case .gregor: return "Gregor"
            case .cersei: return "Cersei"
            case .tyrion: return "Tyrion"
            case .joffrey: return "Joffrey"
            case .sandor: return "Sandor"
            case .sansa: return "Sansa"
            }
        }
            
        var lastName: String {
            switch self {
            case .jon: return "Snow"
            case .daenerys: return "Targaryen"
            case .gregor: return "Clegane"
            case .cersei: return "Lannister"
            case .tyrion: return "Lannister"
            case .joffrey: return "Baratheon"
            case .sandor: return "Clegane"
            case .sansa: return "Stark"
            }
        }
        
        var imageName: String {
            return "\(self.firstName)\(self.lastName)"
        }
        
        var person: Person {
            return Person(firstName: self.firstName, lastName: self.lastName, profileImage: UIImage(named: self.imageName))
        }
        
        static func allPeople() -> [Person] {
            return [PersonData.jon.person,
                    PersonData.daenerys.person,
                    PersonData.gregor.person,
                    PersonData.cersei.person,
                    PersonData.tyrion.person,
                    PersonData.joffrey.person,
                    PersonData.sandor.person,
                    PersonData.sansa.person]
        }
    }
}
