import SwiftUI

struct EditProfileView: View {
    @State private var name = "Eddie Brock"
    @State private var status = "Available"
    var body: some View {
        Form {
            Section {
                HStack(alignment: .top) {
                    VStack {
                        AvatarView()
                        Button("Edit") {}
                    }
                    Text("Enter your name or change your profile photo")
                        .foregroundStyle(.secondary)
                }
                TextField("", text: $name)
            }

            Section("Status") {
                NavigationLink(destination: StatusSelectorView(selected: $status)) {
                    Text(status)
                }
            }
        }
        .navigationTitle("Edit Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        EditProfileView()
    }
}
