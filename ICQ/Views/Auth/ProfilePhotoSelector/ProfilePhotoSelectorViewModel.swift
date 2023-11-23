import SwiftUI

final class ProfilePhotoSelectorViewModel: ObservableObject {
    @Published var avatarImage: UIImage?
    var image: Image {
        Image(uiImage: avatarImage ?? UIImage(resource: .plusPhoto))
    }

    func saveAvatar() {
        guard let avatarImage else { return }
        Task {
            do {
                try await FirebaseClient.shared.uploadAvatarImage(avatarImage)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
