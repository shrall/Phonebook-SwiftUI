//
//  Contact.swift
//  Phonebook-SwiftUI
//
//  Created by Marshall Kurniawan on 12/05/23.
//

import Foundation

struct Team: Hashable, Codable {
    let idTeam: String?
    let strTeam: String?
    let strLeague: String?
    let strTeamBadge: String?
    let strDescriptionEN: String?
}

struct Contact {
    let id: UUID
    let profileEmoji: String
    let name: String
    let phone: String
    let email: String?
    let website: String?
    let notes: String?
}
