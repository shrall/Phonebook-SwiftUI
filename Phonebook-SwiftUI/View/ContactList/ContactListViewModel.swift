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
    
    @Published var contacts: [String: [Contact]] = [:]
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
                by: { $0.name?.first?.uppercased() ?? "" }
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
        contact.website = addHttpsPrefix(website)
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
    
    func validateFormField() -> Bool {
        var validated = true
        if name == "" || phone == "" || !validateEmail(email) || !validateLink(website) {
            validated = false
        }
        return validated
    }
    
    func validateEmail(_ string: String) -> Bool {
        if string == "" {
            return true
        }
        if string.count > 100 {
            return false
        }
        let emailFormat = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" + "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" + "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: string)
    }
    
    func validateLink(_ string: String) -> Bool {
        if string == "" {
            return true
        }
        let types: NSTextCheckingResult.CheckingType = [.link]
        let detector = try? NSDataDetector(types: types.rawValue)
        guard detector != nil, string.count > 0 else { return false }
        if detector!.numberOfMatches(in: string, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, string.count)) > 0 {
            return true
        }
        return false
    }
    
    func addHttpsPrefix(_ urlString: String) -> String {
        if urlString == ""{
            return urlString
        }
        if urlString.contains("http://") || urlString.contains("https://") {
            return urlString
        } else {
            return "https://" + urlString
        }
    }
}
