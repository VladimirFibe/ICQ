import SwiftUI

struct ChatsCell: View {
    let recent: Recent
    var body: some View {
        HStack {
            AvatarView(url: recent.avatarLink, width: 48)
            VStack(alignment: .leading, spacing: 4) {
                Text(recent.uid)
                    .font(.system(size: 14, weight: .semibold))
                Text(recent.text)
                    .font(.system(size: 15))
                    .lineLimit(2)
                    .foregroundStyle(.secondary)
            }
            Spacer()
        }
    }
}

#Preview {
    ChatsCell(recent: Recent(uid: "username", avatarLink: "", text: "text"))
}
