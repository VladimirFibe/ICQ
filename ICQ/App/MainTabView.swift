import SwiftUI

enum MainTabs {
    case chats
    case channels
    case settings

    var title: String {
        switch self {
        case .chats: return "Chats"
        case .channels: return "Channels"
        case .settings: return "Settings"
        }
    }
}

struct MainTabView: View {
    @State private var selection: MainTabs = .chats
    var body: some View {
        NavigationStack {
            TabView(selection: $selection) {
                ChatsView()
                    .tabItem { Image(systemName: "bubble.left") }
                    .tag(MainTabs.chats)
                ChannelsView()
                    .tabItem { Image(systemName: "bubble.left.and.bubble.right") }
                    .tag(MainTabs.channels)
                SettingsView()
                    .tabItem { Image(systemName: "gear") }
                    .tag(MainTabs.settings)
            }
            .navigationTitle(selection.title)
        }
    }
}

#Preview {
    MainTabView()
}
