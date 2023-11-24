import SwiftUI

struct ChatView: View {
    @State private var text = ""
    @ObservedObject var viewModel: ChatViewModel
    var body: some View {
        VStack {
            List(viewModel.messages) { message in
                MessageView(viewModel: MessageViewModel(message: message))
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            ChatInputView(text: $text) {
                if !text.isEmpty {
                    viewModel.sendMessage(text)
                }
                text = ""
            }
        }
        .toolbar(.hidden, for: .tabBar)
        .navigationTitle(viewModel.friendName)
    }

}

#Preview {
    ChatView(viewModel: ChatViewModel(recent: Recent(uid: "", avatarLink: "", text: "")))
}
