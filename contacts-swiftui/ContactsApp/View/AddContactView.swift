//
//  AddContactView.swift
//  contacts-swiftui
//
//  Created by Aya on 04/04/2025.
//

import SwiftUI

struct AddContactView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(ContactViewModel.self) var viewModel
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("First Name", text: $firstName)
                TextField("Last name", text: $lastName)
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
                
            }
            .navigationTitle("New Contact")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        addNewContact()
                        dismiss()
                    }
                    .fontWeight(.bold)
                }
            }
        }
    }
}

extension AddContactView {
    func addNewContact() {
        let contact = Contact(
            id: UUID().uuidString,
            firstName: firstName,
            lastName: lastName,
            email: email
        )
        viewModel.addContact(contact)
    }
}

#Preview {
    AddContactView()
        .environment(ContactViewModel())
}
