//
//  ContactViewModel.swift
//  contacts-swiftui
//
//  Created by Aya on 05/04/2025.
//

import Observation

@Observable
class ContactViewModel {
    var contacts = [Contact]()
    
    init() {
        fetchContacts()
    }
    
    func fetchContacts() {
        contacts = [
            .init(id: "1",
                  firstName: "Pierre",
                  lastName: "Gasly",
                  email: "p.gasly@f1.com"),
            .init(id: "2",
                  firstName: "Max",
                  lastName: " Verstappen",
                  email: "m.verstappen@f1.com"),
            .init(id: "3",
                  firstName: "Lewis",
                  lastName: "Hamilton",
                  email: "l.hamilton@f1.com"),
            .init(id: "4",
                  firstName: "Charles",
                  lastName: " Leclerc",
                  email: "c.leclerc@f1.com")
        ]
    }
    
    func addContact(_ contact: Contact) {
        contacts.append(contact)
    }
    
    func deleteContact(_ contact: Contact) {
        guard let index = contacts.firstIndex(where: { $0.id == contact.id}) else { return }
        contacts.remove(at: index)
    }
    
    func updateContact(_ contact: Contact) {
        guard let index = contacts.firstIndex(where: { $0.id == contact.id}) else { return }
        contacts[index] = contact
    }
}
