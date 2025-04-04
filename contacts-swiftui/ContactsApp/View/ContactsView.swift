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
    @State private var searchText: String = ""
    @State private var showAddContactView: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(contacts) { contact in
                    NavigationLink(value: contact) {
                        ContactRowView(contact: contact)
                    }
                }
            }
            .sheet(isPresented: $showAddContactView, content: {
                AddContactView().presentationDetents([.medium])
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showAddContactView.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }
            .navigationDestination(for: Contact.self, destination: { contact in
                Text(contact.firstName)
            })
            .navigationTitle("Contacts")
            .searchable(text: $searchText)
        }
    }
}

#Preview {
    ContactsView()
}
