import SwiftUI

struct MessageViewModel {
    let message: Message
    
    var avatarLink: String? {
        message.avatarLink
    }

    var uid: String {
        message.uid
    }

    var currentUid: String {
        Person.currentId
    }

    var text: String {
        message.text
    }

    var name: String? {
        message.name
    }
}
