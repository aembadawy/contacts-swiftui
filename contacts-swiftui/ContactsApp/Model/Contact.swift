//
//  Contact.swift
//  contacts-swiftui
//
//  Created by Aya on 02/04/2025.
//

import Foundation

struct Contact: Identifiable, Hashable{
    let id: String
    var firstName: String
    var lastName: String
    var email: String
    
    var initials: String {
        String(firstName.prefix(1) + lastName.prefix(1)).uppercased()
    }
}
 
