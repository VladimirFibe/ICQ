import SwiftUI

struct ChatsCell: View {
    let chat: String
    var body: some View {
        HStack {
            AvatarView(width: 48)
            VStack(alignment: .leading, spacing: 4) {
                Text(chat)
                    .font(.system(size: 14, weight: .semibold))
                Text("Status")
                    .font(.system(size: 15))
                    .foregroundStyle(.secondary)
            }
            Spacer()
        }
    }
}

#Preview {
    ChatsCell(chat: "Katya")
}
