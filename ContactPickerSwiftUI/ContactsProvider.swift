import Foundation
import Contacts

class ContactsProvider {
    
    let store: CNContactStore
    let keys: [CNKeyDescriptor]
    
    init() {
        store = CNContactStore()
        
        keys = [CNContactImageDataKey as CNKeyDescriptor,
                CNContactPhoneNumbersKey as CNKeyDescriptor,
                CNContactEmailAddressesKey as CNKeyDescriptor,
                CNContactFormatter.descriptorForRequiredKeys(for: .fullName)]
    }
    
    func requestAccess() {
        store.requestAccess(for: .contacts) {
            (granted, error) in
            return
        }
        // TODO do something useful with completionHandler
    }

    func fetchContacts(sortOrder: CNContactSortOrder = .userDefault) -> [CNContact] {
        let authStatus = CNContactStore.authorizationStatus(for: .contacts)
        if authStatus == .notDetermined {
            requestAccess()
        } else if authStatus == .restricted {
            // TODO prompt user that app is useless without access to contacts
        }
        
        let fetchRequest = CNContactFetchRequest(keysToFetch: keys)
        fetchRequest.sortOrder = sortOrder
        
        var fetchedContacts = [CNContact]()
        
        do {
            try store.enumerateContacts(with: fetchRequest) {
                (contact, stop) in
                fetchedContacts.append(contact)
            }
        } catch  {
            print("Unable to fetch contacts. \(error)")
        }
        
        return fetchedContacts
    }
}
