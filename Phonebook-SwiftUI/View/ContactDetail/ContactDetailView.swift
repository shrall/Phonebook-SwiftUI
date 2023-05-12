//
//  ContactDetailView.swift
//  Phonebook-SwiftUI
//
//  Created by Marshall Kurniawan on 12/05/23.
//

import SwiftUI

struct ContactDetailView: View {
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(.secondary.opacity(0.2))
                    .frame(width: 120, height: 120)
                Text("🧁")
                    .font(.system(size: 60))
            }
            Text("John Doe")
                .font(.system(size: 32))
            Text("0812312312")
                .font(.system(size: 16))
                .foregroundColor(.secondary)
            HStack(spacing: 24) {
                Button {
                    // TODO: SMS
                } label: {
                    ZStack {
                        Circle()
                            .fill(.secondary.opacity(0.2))
                            .frame(width: 52, height: 52)
                        Image(systemName: "message.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24)
                    }
                }
                Button {
                    // TODO: Call
                } label: {
                    ZStack {
                        Circle()
                            .fill(.secondary.opacity(0.2))
                            .frame(width: 52, height: 52)
                        Image(systemName: "phone.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24)
                    }
                }
            }
            List {
                HStack(alignment: .center) {
                    VStack(alignment: .leading) {
                        Text("E-Mail")
                            .foregroundColor(.secondary)
                            .font(.system(size: 16))
                        Text("johndoe@phonebook.com")
                            .font(.system(size: 18))
                    }
                    Spacer()
                    Button {
                        // TODO: E-Mail
                    } label: {
                        Image(systemName: "envelope")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24)
                    }
                }
                HStack(alignment: .center) {
                    VStack(alignment: .leading) {
                        Text("Website")
                            .foregroundColor(.secondary)
                            .font(.system(size: 16))
                        Text("johndoe.design")
                            .font(.system(size: 18))
                    }
                    Spacer()
                    Button {
                        // TODO: WebView
                    } label: {
                        Image(systemName: "globe")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24)
                    }
                }
                HStack(alignment: .center) {
                    VStack(alignment: .leading) {
                        Text("Notes")
                            .foregroundColor(.secondary)
                            .font(.system(size: 16))
                        Text("This guy is a bit weird?!")
                            .font(.system(size: 18))
                    }
                    Spacer()
                }
            }
            .listStyle(.insetGrouped)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Text("Edit")
            }
        }
    }
}

struct ContactDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetailView()
    }
}
