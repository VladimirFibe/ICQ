import SwiftUI

enum SettingsCellViewModel: Identifiable, CaseIterable {
    case account
    case notifications
    case starredMessages
    
    var id: SettingsCellViewModel {
        self
    }
    var title: String {
        switch self {
        case .account: return "Account"
        case .notifications: return "Notifications"
        case .starredMessages: return "Starred Messages"
        }
    }
    
    var color: Color {
        switch self {
        case .account: return .blue
        case .notifications: return .red
        case .starredMessages: return .yellow
        }
    }
    
    var image: String {
        switch self {
        case .account: return "key.fill"
        case .notifications: return "bell.badge.fill"
        case .starredMessages: return "star.fill"
        }
    }
}
