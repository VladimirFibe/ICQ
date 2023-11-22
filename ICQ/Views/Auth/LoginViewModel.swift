import Foundation

final class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""

    func login() {
        guard !email.isEmpty, !password.isEmpty else { return }
        Task {
            do {
                let _ = try await FirebaseClient.shared.login(withEmail: email, password: password)
            } catch {
                print(error.localizedDescription)
            }
        }
    }

}
