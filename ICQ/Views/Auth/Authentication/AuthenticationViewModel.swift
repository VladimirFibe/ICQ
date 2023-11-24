import Foundation
import FirebaseAuth

@MainActor
final class AuthenticationViewModel: ObservableObject {
    @Published var addPhoto = false
    @Published var authenticationState: AuthenticationState = .unauthenticated
    @Published var person: Person?

    private var authStateHandler: AuthStateDidChangeListenerHandle?
    static let shared = AuthenticationViewModel()
    private init() {
        registerAuthStateHandler()
    }
    
    func registerAuthStateHandler() {
        if authStateHandler == nil {
            authStateHandler = Auth.auth().addStateDidChangeListener { auth, user in
                self.authenticationState = .authenticating
                if user != nil {
                    self.fetchPerson()
                } else {
                    self.authenticationState = .unauthenticated
                }
            }
        }
    }

    func fetchPerson() {
        Task {
            do {
                guard let id = Auth.auth().currentUser?.uid else { return }
                let querySnapshot = try await COLLECTION_PERSONS.document(id).getDocument()
                person = try? querySnapshot.data(as: Person.self)
                if let link = person?.avatarLink, link.isEmpty {
                    addPhoto = true
                }
                authenticationState = .authenticated
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
