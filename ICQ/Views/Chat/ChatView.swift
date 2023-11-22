import SwiftUI

struct ChatView: View {
    @State private var text = ""
    @ObservedObject var viewModel = ChatViewModel()
    var body: some View {
        VStack {
            List(viewModel.messages) { message in
                MessageView(viewModel: MessageViewModel(message: message))
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)

        }
        .toolbar(.hidden, for: .tabBar)
        ChatInputView(text: $text) {
            let message = Message(text: text)
            viewModel.messages.append(message)
            text = ""
        }
        .onAppear {
            viewModel.getMessages()
        }
    }

}

#Preview {
    ChatView()
}
