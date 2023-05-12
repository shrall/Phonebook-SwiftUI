//
//  ContactListView.swift
//  Phonebook-SwiftUI
//
//  Created by Marshall Kurniawan on 12/05/23.
//

import SwiftUI

struct ContactListView: View {
    @State var present = true
    var body: some View {
        VStack {
            List {
                Section(header: Text("J")) {
                    NavigationLink(destination: ContactDetailView()) {
                        ContactRow(name: "John Doe", emoji: "🧁", phone: "08214581283")
                    }
                }.headerProminence(.increased)
                Section(header: Text("K")) {
                    NavigationLink(destination: ContactDetailView()) {
                        ContactRow(name: "Kohn Doe", emoji: "💋", phone: "08214581283")
                    }
                }.headerProminence(.increased)
            }.listStyle(.insetGrouped)
        }
        .navigationTitle("Contacts")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Text("Add")
            }
        }
    }
}

struct ContactListView_Previews: PreviewProvider {
    static var previews: some View {
        ContactListView()
    }
}
