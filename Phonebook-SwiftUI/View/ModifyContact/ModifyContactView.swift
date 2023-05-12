//
//  ModifyContactView.swift
//  Phonebook-SwiftUI
//
//  Created by Marshall Kurniawan on 12/05/23.
//

import SwiftUI

struct ModifyContactView: View {
    @State private var emoji = "😎"
    @State private var name = ""
    @State private var phone = ""
    @State private var email = ""
    @State private var website = ""
    @State private var note = ""
    @State private var showEmojiPicker = false
    var body: some View {
        NavigationView {
            VStack(spacing: 8) {
                Button {
                    showEmojiPicker = true
                } label: {
                    ZStack {
                        Circle()
                            .fill(.gray.opacity(0.2))
                            .frame(width: 120, height: 120)
                        Text(emoji)
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
                        TextField("Name", text: $name)
                        TextField("Phone", text: $phone)
                            .keyboardType(.decimalPad)
                        TextField("E-mail", text: $email)
                        TextField("Website", text: $website)
                    }
                    Section{
                        VStack(alignment: .leading){
                            Text("Notes")
                                .foregroundColor(.secondary)
                            TextField("", text: $note, axis: .vertical)
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
                        // TODO: Save
                    } label: {
                        Text("Save")
                    }
                }
            }
            .sheet(isPresented: $showEmojiPicker) {
                EmojiPicker(selectedEmoji: $emoji, dismiss: { showEmojiPicker.toggle() })
            }
        }
    }
}

struct ModifyContactView_Previews: PreviewProvider {
    static var previews: some View {
        ModifyContactView()
    }
}
