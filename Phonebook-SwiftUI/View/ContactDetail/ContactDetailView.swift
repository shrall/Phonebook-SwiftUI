//
//  ContactDetailView.swift
//  Phonebook-SwiftUI
//
//  Created by Marshall Kurniawan on 12/05/23.
//

import SwiftUI

struct ContactDetailView: View {
    var name: String
    var phone: String
    var emoji: String
    var email: String?
    var website: String?
    var notes: String?

    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(.secondary.opacity(0.2))
                    .frame(width: 120, height: 120)
                Text(emoji)
                    .font(.system(size: 60))
            }
            Text(name)
                .font(.system(size: 32))
            Text(phone)
                .font(.system(size: 16))
                .foregroundColor(.secondary)
            HStack(spacing: 24) {
                Link(destination: URL(string: "sms:\(phone)")!){
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
                Link(destination: URL(string: "tel:\(phone)")!){
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
                        if let email = email, email != "" {
                            Link(email, destination: URL(string: "mailto:\(email)")!).font(.system(size: 18))
                        } else {
                            Text("-")
                                .font(.system(size: 18))
                        }
                    }
                    Spacer()
                    Image(systemName: "envelope")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24)
                        .foregroundColor(email == "" ? .secondary : .primary)
                }
                HStack(alignment: .center) {
                    VStack(alignment: .leading) {
                        Text("Website")
                            .foregroundColor(.secondary)
                            .font(.system(size: 16))
                        if let website = website, website != "" {
                            Link(website, destination: URL(string: website)!).font(.system(size: 18))
                        } else {
                            Text("-")
                                .font(.system(size: 18))
                        }
                    }
                    Spacer()
                    Image(systemName: "globe")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24)
                        .foregroundColor(website == "" ? .secondary : .primary)
                }
                HStack(alignment: .center) {
                    VStack(alignment: .leading) {
                        Text("Notes")
                            .foregroundColor(.secondary)
                            .font(.system(size: 16))
                        Text((notes == "" ? "-" : notes)!)
                            .multilineTextAlignment(.leading)
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
        ContactDetailView(name: "Marshall", phone: "08123123123", emoji: "😎")
    }
}
