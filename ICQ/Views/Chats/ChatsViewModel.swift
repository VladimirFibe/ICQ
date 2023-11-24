import Firebase

@MainActor
final class ChatsViewModel: ObservableObject {
    @Published var recents: [Recent] = []
    init() {
        fetchMessages()
    }
    func fetchMessages() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let query = COLLECTION_MESSAGES
            .document(uid)
            .collection("recents")
            .order(by: "timestamp", descending: true)

        query.addSnapshotListener { snapshot, _ in
            if let snapshot {
                self.recents = snapshot.documents.compactMap{try? $0.data(as: Recent.self)}
            }
        }
    }
}
