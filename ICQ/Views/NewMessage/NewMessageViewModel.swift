import SwiftUI
import FirebaseFirestore

@MainActor
final class NewMessageViewModel: ObservableObject {
    @Published var persons: [Person] = []

    init() {
        fetchPersons()
    }
    func fetchPersons() {
        Task {
            do {
                let snapshot = try await Firestore.firestore().collection("persons").getDocuments()
                persons = snapshot.documents.compactMap { try? $0.data(as: Person.self)}
                persons = persons.filter{$0.id != Person.currentId}
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
