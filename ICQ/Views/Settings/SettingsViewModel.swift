import Foundation

final class SettingsViewModel: ObservableObject {
    func logout() {
        do {
            try FirebaseClient.shared.signOut()
        } catch {
            print(error.localizedDescription)
        }
    }
}
