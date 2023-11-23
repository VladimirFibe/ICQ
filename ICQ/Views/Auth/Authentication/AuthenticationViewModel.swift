import Foundation
import FirebaseAuth

@MainActor
final class AuthenticationViewModel: ObservableObject {
    @Published var addPhoto = false
    @Published var authenticationState: AuthenticationState = .unauthenticated
    private var authStateHandler: AuthStateDidChangeListenerHandle?
    
    init() {
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
                try await FirebaseClient.shared.fetchPerson()
                if let link = FirebaseClient.shared.person?.avatarLink, link.isEmpty {
                    addPhoto = true
                }
                authenticationState = .authenticated
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
