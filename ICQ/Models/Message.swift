import FirebaseFirestoreSwift
import Firebase


import Foundation

struct Message: Identifiable {
    @DocumentID var id: String? = UUID().uuidString
    var uid: String = ""
    var name: String? = nil // = "Vladimir"
    var profileImageUrl: String? = "https://i.pinimg.com/736x/84/d4/b6/84d4b6b6302d87c8b21706c6347be558.jpg"
    var text: String = UUID().uuidString
    var read = false
    var timestamp: Timestamp? = nil
}
