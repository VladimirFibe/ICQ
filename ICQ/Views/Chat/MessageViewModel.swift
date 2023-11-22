import SwiftUI

struct MessageViewModel {
    let message: Message
    var image: String? {
        message.profileImageUrl
    }

    var uid: String {
        message.uid
    }

    var currentUid: String {
//        AuthViewModel.shared.person.id ?? ""
        "Text"
    }

    var text: String {
        message.text
    }
}