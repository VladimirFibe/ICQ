import SwiftUI

struct ChatInputView: View {
    @Binding var text: String
    var action: () -> Void
    var body: some View {
        VStack {
            Rectangle()
                .frame(height: 0.75)
                .foregroundStyle(Color(.separator))

            HStack {
                TextField("Message...", text: $text, axis: .vertical)
                Button(action: action) {
                    Text("Send")
                        .bold()
                }
                .disabled(text.isEmpty)
            }
            .padding()
        }
    }
}

#Preview {
    ChatInputView(text: .constant(""), action: {})
}
