import SwiftUI

enum MainTabs {
    case chats
    case channels
    case settings
}

struct MainTabView: View {
    @State private var selection: MainTabs = .chats
    @State private var show = true
    var body: some View {
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
        .sheet(isPresented: $show) {
            ProfilePhotoSelectorView()
        }
    }
}

#Preview {
    MainTabView()
}
