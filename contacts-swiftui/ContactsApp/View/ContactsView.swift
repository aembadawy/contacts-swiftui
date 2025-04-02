//
//  ContactsView.swift
//  contacts-swiftui
//
//  Created by Aya on 02/04/2025.
//

import SwiftUI

struct ContactsView: View {
    @State private var contacts: [Contact] = [
        .init(id: "1",
              firstName: "Pierre",
              lastName: "Gasly",
              eamil: "p.gasly@f1.com"),
        .init(id: "2",
              firstName: "Max",
              lastName: " Verstappen",
              eamil: "m.verstappen@f1.com"),
        .init(id: "3",
              firstName: "Lewis",
              lastName: "Hamilton",
              eamil: "l.hamilton@f1.com"),
        .init(id: "4",
              firstName: "Charles",
              lastName: " Leclerc",
              eamil: "c.leclerc@f1.com")
    ]
    var body: some View {
        List {
            ForEach(contacts) { contact in
                Text(contact.eamil)
            }
        }
    }
}

#Preview {
    ContactsView()
}
