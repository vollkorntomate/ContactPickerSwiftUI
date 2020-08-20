import SwiftUI
import Contacts

struct ContentView: View {
    @State var showPicker = false
    @State var selectedContact: CNContact?
    
    var body: some View {
        VStack {
            Button("Select Contact".localized) {
                self.showPicker.toggle()
            }
            Text(selectedContact != nil ? "Selected: \((selectedContact?.familyName)!) \((selectedContact?.givenName)!)" : "Nothing selected".localized)
        }
        .sheet(isPresented: self.$showPicker) {
            ContactPickerView(showPicker: self.$showPicker, selectedContact: self.$selectedContact)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
