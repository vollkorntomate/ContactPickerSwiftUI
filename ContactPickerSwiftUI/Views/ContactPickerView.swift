import SwiftUI
import Contacts

struct ContactPickerView: View {
    @Binding var showPicker: Bool
    @Binding var selectedContact: CNContact?
    var contacts: [String: [CNContact]] = loadContactsGrouped()
    
    var body: some View {
        let keys = (Array(contacts.keys) as [String]).sorted()
        NavigationView {
            List {
                ForEach(keys.sorted(), id: \.self) { key in
                    Section(header: Text(key)) {
                        ForEach(contacts[key] ?? [CNContact](), id: \.identifier) { contact in
                            ContactRow(contact: contact, showPicker: self.$showPicker, selectedContact: self.$selectedContact)
                        }
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("All Contacts".localized)
            .navigationBarItems(trailing: Button(action: {self.showPicker = false}, label: {
                Text("Cancel".localized)
            }))
        }
    }

    static func loadContactsGrouped() -> [String: [CNContact]] {
        let provider = ContactsProvider()
        let contacts = provider.fetchContacts()
        
        let group = Dictionary(grouping: contacts) { (contact) -> String in
            return String(contact.familyName.first ?? "?")
        }
        
        return group
    }
}

/*
struct ContactPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ContactPickerView()
    }
}
*/
