import SwiftUI

struct SettingsHeaderView: View {
    let viewModel = SettingsHeaderViewModel()
    var body: some View {
        HStack {
            viewModel.image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 64, height: 64)
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 4) {
                Text(viewModel.fullname)
                    .bold()
                Text(viewModel.status)
                    .foregroundStyle(.secondary)
            }
            .font(.system(size: 14))
        }
    }
}

#Preview {
    SettingsHeaderView()
}
