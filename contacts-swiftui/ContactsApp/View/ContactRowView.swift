//
//  ContactRowView.swift
//  contacts-swiftui
//
//  Created by Aya on 02/04/2025.
//

import SwiftUI

struct ContactRowView: View {
    let contact: Contact
    
    var body: some View {
        HStack {
            Text("MJ")
                .foregroundStyle(Color.white)
                .frame(width: 48, height: 48)
                .background(Color(.systemGray4))
                .clipShape(Circle())
           
            VStack(alignment: .leading, spacing: 0) {
                Text(contact.firstName + " " + contact.lastName)
                    .font(.headline)
                
                Text(contact.eamil)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        
    }
}

#Preview {
    ContactRowView(contact: Contact(id: "1",
                                    firstName: "Pierre",
                                    lastName: "Gasly",
                                    eamil: "p.gasly@f1.com"))
}
