import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @State private var avatarImage: UIImage?
    @State private var photosPickerItem: PhotosPickerItem?
    @State private var name = "Eddie Brock"
    @State private var status = "Available"
    var body: some View {
        Form {
            Section {
                HStack(alignment: .top) {
                    VStack {
                        Image(uiImage: avatarImage ?? UIImage(resource: .avatar))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 64, height: 64)
                            .clipShape(Circle())
                        PhotosPicker("Edit", selection: $photosPickerItem, matching: .images)
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
        .onChange(of: photosPickerItem) { _, _ in
            Task {
                if let photosPickerItem,
                   let data = try? await photosPickerItem.loadTransferable(type: Data.self) {
                    avatarImage = UIImage(data: data)
                }
                photosPickerItem = nil
            }
        }
    }
}

#Preview {
    NavigationStack {
        EditProfileView()
    }
}
