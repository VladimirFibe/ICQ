import SwiftUI

struct ChatView: View {
    var messages: [Message] = [Message(), Message(profileImageUrl: nil), Message(), Message()]
    var body: some View {
        List(messages) { message in
            MessageView(viewModel: MessageViewModel(message: message))
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    ChatView()
}
