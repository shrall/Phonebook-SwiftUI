//
//  ContactRow.swift
//  Phonebook-SwiftUI
//
//  Created by Marshall Kurniawan on 12/05/23.
//

import SwiftUI

struct ContactRow: View {
    let name: String
    let emoji: String
    let phone: String

    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                Circle()
                    .fill(.gray.opacity(0.2))
                    .frame(width: 40, height: 40)
                Text(emoji)
                    .font(.system(size: 24))
            }
            VStack(alignment: .leading) {
                Text(name)
                Text(phone)
                    .font(.system(size: 12))
                    .foregroundColor(.secondary)
            }
        }
    }
}
