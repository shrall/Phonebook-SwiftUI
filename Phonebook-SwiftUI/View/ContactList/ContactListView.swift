//
//  ContactListView.swift
//  Phonebook-SwiftUI
//
//  Created by Marshall Kurniawan on 12/05/23.
//

import SwiftUI

struct ContactListView: View {
    @StateObject var contactListVM = ContactListViewModel()
    var body: some View {
        VStack {
            List {
                ForEach(contactListVM.contacts.keys.sorted(), id: \.self) { key in
                    Section(header: Text(key)) {
                        ForEach(contactListVM.contacts[key]!, id: \.self) { contact in
                            NavigationLink(destination: ContactDetailView(name: contact.name!, phone: contact.phone!, emoji: contact.profileEmoji!, email: contact.email, website: contact.website, notes: contact.notes)) {
                                ContactRow(name: contact.name!, emoji: contact.profileEmoji!, phone: contact.phone!)
                            }
                        }
                    }.headerProminence(.increased)
                }
            }
            .listStyle(.insetGrouped)
            .overlay(Group {
                if contactListVM.contacts.isEmpty {
                    Text("No Contacts Have Been Added")
                }
            })
        }
        .navigationTitle("Contacts")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    contactListVM.presentContactForm = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $contactListVM.presentContactForm) {
            ModifyContactView()
                .environmentObject(contactListVM)
        }
    }
}

struct ContactListView_Previews: PreviewProvider {
    static var previews: some View {
        ContactListView()
    }
}
