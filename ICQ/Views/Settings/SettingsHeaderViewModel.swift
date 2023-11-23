import SwiftUI

final class SettingsHeaderViewModel {
    var fullname: String {
        FirebaseClient.shared.person?.fullname ?? ""
    }

    var status: String {
        FirebaseClient.shared.person?.status ?? ""
    }
    
    var image: Image {
        Image(uiImage: FirebaseClient.shared.avatarImage ?? UIImage(resource: .avatar))
    }
}
