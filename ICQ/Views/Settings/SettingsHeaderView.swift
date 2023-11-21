import SwiftUI

struct SettingsHeaderView: View {
    var body: some View {
        HStack {
            AvatarView()
            VStack(alignment: .leading, spacing: 4) {
                Text("Eddie Brock")
                    .bold()
                Text("Available")
                    .foregroundStyle(.secondary)
            }
            .font(.system(size: 14))
        }
    }
}

#Preview {
    SettingsHeaderView()
}
