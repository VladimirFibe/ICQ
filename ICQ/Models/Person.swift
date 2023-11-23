import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Person: Identifiable, Hashable, Codable {
    @DocumentID var id: String?
    var username = ""
    var email = ""
    var pushId = ""
    var avatarLink = ""
    var fullname = ""
    var status = "Available"

    static var currentId: String {
        Auth.auth().currentUser?.uid ?? ""
    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}
