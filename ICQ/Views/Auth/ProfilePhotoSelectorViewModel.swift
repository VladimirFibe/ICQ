import SwiftUI
import PhotosUI

final class ProfilePhotoSelectorViewModel: ObservableObject {
    @Published var avatarImage: UIImage?
    var image: Image {
        Image(uiImage: avatarImage ?? UIImage(resource: .plusPhoto))
    }

    func saveAvatar() {
        guard let avatarImage else { return }
        Task {
            do {
                if let url = try await FirebaseClient.shared.uploadImage(avatarImage) {
                    print(url)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
