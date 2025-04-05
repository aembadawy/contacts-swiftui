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
        VStack {
            HStack {
                
                Text("MJ")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.black)
                    .overlay{
                        Circle()
                            .frame(width: 48, height: 48)
                            .foregroundStyle(Color.gray)
                            .opacity(0.2)
                    }
                
                VStack(alignment: .leading, spacing: 0) {
                    Text(contact.firstName + contact.lastName)
                        .font(.headline)
                    Text(contact.eamil)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    ContactRowView(contact: Contact(id: "1",
                                            firstName: "Pierre",
                                            lastName: "Gasly",
                                            eamil: "p.gasly@f1.com"))
}
