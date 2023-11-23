import SwiftUI

struct ChatView: View {
    @State private var text = ""
    @ObservedObject var viewModel = ChatViewModel()
    var person: Person
    var body: some View {
        VStack {
            List(viewModel.messages) { message in
                MessageView(viewModel: MessageViewModel(message: message))
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            ChatInputView(text: $text) {
                let message = Message(text: text)
                viewModel.messages.append(message)
                text = ""
            }
        }
        .toolbar(.hidden, for: .tabBar)
        .navigationTitle(person.username)
        .onAppear {
            viewModel.getMessages()
        }
    }

}
//
//#Preview {
//    ChatView()
//}
