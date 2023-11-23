import SwiftUI

final class EditProfileViewModel: ObservableObject {
    @Published var name = ""
    @Published var status = "Available"
    @Published var avatarImage: UIImage?

    init() {
        name = FirebaseClient.shared.person?.fullname ?? ""
        status = FirebaseClient.shared.person?.status ?? "Available"
        avatarImage = FirebaseClient.shared.avatarImage
    }
    
    var image: Image {
        Image(uiImage: avatarImage ?? UIImage(resource: .plusPhoto))
    }

    func save() {
        Task {
            do {
                FirebaseClient.shared.person?.fullname = name
                FirebaseClient.shared.person?.status = status
                try FirebaseClient.shared.updateCurrentPerson()
                guard let avatarImage else { return }
                FirebaseClient.shared.avatarImage = avatarImage
                try await FirebaseClient.shared.uploadAvatarImage(avatarImage)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
