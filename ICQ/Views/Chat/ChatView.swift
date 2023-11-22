import SwiftUI

struct ChatView: View {
    @State private var text = ""
    var messages: [Message] = [
        Message(), Message(profileImageUrl: nil), Message(), Message()
    ]
    var body: some View {
        VStack {
            List(messages) { message in
                MessageView(viewModel: MessageViewModel(message: message))
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)

        }
        .toolbar(.hidden, for: .tabBar)
        ChatInputView(text: $text) {
            print(text)
            text = ""
        }
    }
}

#Preview {
    ChatView()
}
