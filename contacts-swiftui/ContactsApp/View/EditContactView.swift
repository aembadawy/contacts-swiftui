//
//  EditContactView.swift
//  contacts-swiftui
//
//  Created by Aya on 05/04/2025.
//

import SwiftUI

struct EditContactView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(ContactViewModel.self) var viewModel
    @State private var contact: Contact
    
    init(contact: Contact) {
        self._contact = State(initialValue: contact)
    }
    
    var body: some View {
        VStack {
            Form {
                TextField("First Name", text: $contact.firstName)
                TextField("Last name", text: $contact.lastName)
                TextField("Email", text: $contact.email)
                    .keyboardType(.emailAddress)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
            }
            
            Button("Delete Contact") {
                deleteContact()
            }
            
        }
        .navigationTitle("Edit Contact")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    updateContact()
                }
                .fontWeight(.bold)
            }
        }
    }
}
extension EditContactView {
    func deleteContact() {
        viewModel.deleteContact(contact)
        dismiss()
    }
    
    func updateContact() {
        viewModel.updateContact(contact)
        dismiss()
    }
}

#Preview {
    EditContactView(
        contact:Contact(id: "1",
                        firstName: "Pierre",
                        lastName: "Gasly",
                        email: "p.gasly@f1.com"))
    .environment(ContactViewModel())
}
