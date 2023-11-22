import Foundation

final class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var username = ""
    @Published var fullname = ""

    func register() {
        guard !email.isEmpty, password.count > 5 else { return }
        Task {
            do {
                try await FirebaseClient.shared.register(
                    withEmail: email,
                    password: password,
                    username: username,
                    fullname: fullname)
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    func uploadProfileImage() {

    }
}
