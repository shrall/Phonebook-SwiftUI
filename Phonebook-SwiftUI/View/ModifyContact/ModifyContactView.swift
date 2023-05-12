//
//  ModifyContactView.swift
//  Phonebook-SwiftUI
//
//  Created by Marshall Kurniawan on 12/05/23.
//

import SwiftUI

struct ModifyContactView: View {
    @EnvironmentObject var contactListVM: ContactListViewModel
    
    var body: some View {
        NavigationView {
            VStack(spacing: 8) {
                Button {
                    contactListVM.showEmojiPicker = true
                } label: {
                    ZStack {
                        Circle()
                            .fill(.gray.opacity(0.2))
                            .frame(width: 120, height: 120)
                        Text(contactListVM.profileEmoji)
                            .font(.system(size: 60))
                    }
                }
                VStack {
                    Image(systemName: "hand.tap")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24)
                        .foregroundColor(.secondary)
                    Text("Tap to change emoji")
                        .font(.system(size: 12))
                        .foregroundColor(.secondary)
                }
                List {
                    Section{
                        TextField("Name", text: $contactListVM.name)
                        TextField("Phone", text: $contactListVM.phone)
                            .keyboardType(.decimalPad)
                        TextField("E-mail", text: $contactListVM.email)
                        TextField("Website", text: $contactListVM.website)
                    }
                    Section{
                        VStack(alignment: .leading){
                            Text("Notes")
                                .foregroundColor(.secondary)
                            TextField("", text: $contactListVM.notes, axis: .vertical)
                        }
                    }
                }
                .listStyle(.grouped)
            }
            .navigationTitle("Add New Contact")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        contactListVM.addContact()
                    } label: {
                        Text("Save")
                    }
                    .disabled(!contactListVM.validateFormField())
                    .foregroundColor(!contactListVM.validateFormField() ? .secondary : .accentColor)
                }
            }
            .sheet(isPresented: $contactListVM.showEmojiPicker) {
                EmojiPicker(selectedEmoji: $contactListVM.profileEmoji, dismiss: { contactListVM.showEmojiPicker.toggle() })
            }
        }
    }
}

struct ModifyContactView_Previews: PreviewProvider {
    static var previews: some View {
        ModifyContactView()
    }
}
