//
//  ContactsView.swift
//  contacts-swiftui
//
//  Created by Aya on 02/04/2025.
//

import SwiftUI

struct ContactsView: View {
    
    @State private var viewModel = ContactViewModel()
    @State private var searchText: String = ""
    @State private var showAddContactView: Bool = false
    
    var serchResults: [Contact] {
        return viewModel.searchResults(searchText)
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(serchResults) { contact in
                    NavigationLink(value: contact) {
                        ContactRowView(contact: contact)
                    }
                }
            }
            .sheet(isPresented: $showAddContactView, content: {
                AddContactView()
                    .environment(viewModel)
                    .presentationDetents([.height(300)])
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
                EditContactView(contact: contact)
                    .environment(viewModel)
            })
            .navigationTitle("Contacts")
            .searchable(text: $searchText)
        }
    }
}

#Preview {
    ContactsView()
}
