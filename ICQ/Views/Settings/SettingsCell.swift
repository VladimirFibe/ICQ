import SwiftUI

struct SettingsCell: View {
    let viewModel: SettingsCellViewModel

    var body: some View {
        HStack {
            Image(systemName: viewModel.image)
                .resizable()
                .scaledToFit()
                .frame(width: 22, height: 22)
                .padding(6)
                .background(viewModel.color)
                .foregroundStyle(.white)
                .cornerRadius(6)
            
            Text(viewModel.title)
                .font(.system(size: 15))

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    SettingsCell(viewModel: .account)
}
