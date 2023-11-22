import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel = SettingsViewModel()
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    NavigationLink(destination: EditProfileView()) {
                        SettingsHeaderView()
                    }
                }

                Section {
                    VStack(spacing: 20) {
                      ForEach(SettingsCellViewModel.allCases) { 
                        SettingsCell(viewModel: $0)
                      }
                    }
                }

                Section {
                    Button(action: viewModel.logout) {
                        Text("Log Out")
                            .font(.system(size: 16, weight: .semibold))
                            .frame(maxWidth: .infinity)
                    }
                    .tint(.red)
                }
            }
            .navigationTitle("Settings")
        }
    }
}

#Preview {
    NavigationStack {
        SettingsView()
    }
}
