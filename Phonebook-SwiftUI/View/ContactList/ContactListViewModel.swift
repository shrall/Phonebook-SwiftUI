//
//  ContactListViewModel.swift
//  Phonebook-SwiftUI
//
//  Created by Marshall Kurniawan on 12/05/23.
//

import CoreData
import Foundation

class ContactListViewModel: ObservableObject {
    private let viewContext = PersistenceController.shared.viewContext
    
    @Published var contacts: [String : [Contact]] = [:]
    @Published var presentContactForm = false
    
    @Published var profileEmoji = "😎"
    @Published var name = ""
    @Published var phone = ""
    @Published var email = ""
    @Published var website = ""
    @Published var notes = ""
    @Published var showEmojiPicker = false
    
    init() {
        getAllContacts()
    }
    
    func getAllContacts() {
        let request = NSFetchRequest<Contact>(entityName: "Contact")
        
        do {
            contacts = Dictionary(
                grouping: try viewContext.fetch(request).sorted { $0.name! < $1.name! },
                by: {$0.name?.first?.uppercased() ?? ""}
            )
        } catch {
            print("DEBUG: Some error occured while fetching")
        }
    }
    
    func addContact() {
        let contact = Contact(context: viewContext)
        contact.id = UUID()
        contact.profileEmoji = profileEmoji
        contact.name = name
        contact.phone = phone
        contact.email = email
        contact.website = website
        contact.notes = notes
        save()
        presentContactForm = false
    }
    
    func save() {
        do {
            try viewContext.save()
            getAllContacts()
            resetData()
        } catch {
            print("Error saving")
        }
    }
    
    func resetData() {
        profileEmoji = "😎"
        name = ""
        phone = ""
        email = ""
        website = ""
        notes = ""
    }
}
