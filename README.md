# ContactPickerSwiftUI 

This is a small template for imitating the `CNContactPickerViewController` from UIKit in SwiftUI.

The problem with this exact ViewController is that it doesn't seem to work by using the `UIViewControllerRepresentable` protocol in SwiftUI. There are a few workarounds, for example as described [here](https://stackoverflow.com/questions/57246685/uiviewcontrollerrepresentable-and-cncontactpickerviewcontroller/57621666#57621666). These workarounds work quite ok, but don't provide the best user experience.

## Limitations

My solution does currently not support:
- Searching for contacts
- Jumping to a specific letter
- Order of displaying family name / given Name depending on user settings

## Contribution

If you would like to contribute, feel free to create a fork and open pull requests.
