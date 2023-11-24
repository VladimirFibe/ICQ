import Firebase
import FirebaseFirestoreSwift

struct Recent: Identifiable, Codable, Hashable {
    @DocumentID var id: String?
    var uid: String
    var avatarLink: String
    var text: String
    var read = false
    var timestamp: Timestamp? = nil
}
