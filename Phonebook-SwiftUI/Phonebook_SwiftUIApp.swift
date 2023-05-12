//
//  Phonebook_SwiftUIApp.swift
//  Phonebook-SwiftUI
//
//  Created by Marshall Kurniawan on 12/05/23.
//

import SwiftUI

@main
struct Phonebook_SwiftUIApp: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
