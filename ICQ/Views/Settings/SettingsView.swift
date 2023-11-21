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
                Button(action: {}) {
                    Text("Log Out")
                        .font(.system(size: 16, weight: .semibold))
                        .frame(maxWidth: .infinity)
                }
                .tint(.red)
            }
        }
    }
}

#Preview {
    SettingsView()
}
