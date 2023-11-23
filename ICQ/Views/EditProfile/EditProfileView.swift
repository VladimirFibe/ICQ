import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @ObservedObject var viewModel = EditProfileViewModel()
    @State private var photosPickerItem: PhotosPickerItem?
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Form {
            Section {
                HStack(alignment: .top) {
                    VStack {
                        viewModel.image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 64, height: 64)
                            .clipShape(Circle())
                        PhotosPicker("Edit", selection: $photosPickerItem, matching: .images)
                    }
                    Text("Enter your name or change your profile photo")
                        .foregroundStyle(.secondary)
                }
                TextField("", text: $viewModel.name)
            }

            Section("Status") {
                NavigationLink(destination: StatusSelectorView(selected: $viewModel.status)) {
                    Text(viewModel.status)
                }
            }
        }
        .navigationBarBackButtonHidden()
        .navigationTitle("Edit Profile")
        .navigationBarTitleDisplayMode(.inline)
        .onChange(of: photosPickerItem) { _, _ in
            Task {
                if let photosPickerItem,
                   let data = try? await photosPickerItem.loadTransferable(type: Data.self) {
                    viewModel.avatarImage = UIImage(data: data)
                }
                photosPickerItem = nil
            }
        }
        .toolbar(.hidden, for: .tabBar)
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    viewModel.save()
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        EditProfileView()
    }
}
