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
    @State private var contactDidChange: Bool = false
    
    private let originalContact: Contact
    
    init(contact: Contact) {
        self._contact = State(initialValue: contact)
        self.originalContact = contact
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
        .onChange(of: contact, { oldValue, newValue in
            contactDidChange = newValue != originalContact
        })
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
                .disabled(!contactDidChange)
                .opacity(contactDidChange ? 1.0 : 0.5)
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
