import SwiftUI

struct SettingsView: View {
    var body: some View {
        Form {
            Section {
                SettingsHeaderView()
            }

            Section {
                VStack(spacing: 20) {
                  ForEach(SettingsCellViewModel.allCases) { 
                    SettingsCell(viewModel: $0)
                  }
                }
            }

            Section {
                Text("Log Out")
                    .frame(maxWidth: .infinity)
            }
        }
    }
}

#Preview {
    SettingsView()
}
