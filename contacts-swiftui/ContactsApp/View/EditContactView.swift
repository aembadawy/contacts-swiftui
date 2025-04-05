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
    @State private var showExistConfrimation: Bool = false
    @State private var showDeleteConfrimation: Bool = false

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
                showDeleteConfrimation.toggle()
            }
            
        }
        .onChange(of: contact, { oldValue, newValue in
            contactDidChange = newValue != originalContact
        })
        .alert(
            "Un Saved Changes",
            isPresented: $showExistConfrimation,
            actions: {
                Button("Stay", role: .cancel) { }
                Button("Discard Changes", role: .destructive) {
                    dismiss() 
                }
            }
        )
        .alert(
            "Un Saved Changes",
            isPresented: $showExistConfrimation,
            actions: {
                Button("Cancel", role: .cancel) { }
                Button("Delete", role: .destructive) {
                    deleteContact()
                }
            }
        )
        .navigationTitle("Edit Contact")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    onCancel()
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
    
    func onCancel() {
        if contactDidChange {
            showExistConfrimation = true
        } else {
            dismiss()
        }
    }
    
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
