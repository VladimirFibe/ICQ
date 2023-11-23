import SwiftUI
import PhotosUI

struct ProfilePhotoSelectorView: View {
    @ObservedObject var viewModel = ProfilePhotoSelectorViewModel()
    @State private var photosPickerItem: PhotosPickerItem?
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            VStack {
                PhotosPicker(selection: $photosPickerItem, matching: .images) {
                    viewModel.image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                }
                Spacer()
            }
            .padding(.top, 50)
            .onChange(of: photosPickerItem) { _, _ in
                Task {
                    if let photosPickerItem,
                       let data = try? await photosPickerItem.loadTransferable(type: Data.self) {
                        viewModel.avatarImage = UIImage(data: data)
                    }
                    photosPickerItem = nil
                }
            }
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        viewModel.saveAvatar()
                        dismiss()
                    }
                    .disabled(viewModel.avatarImage == nil)
                }
            }
        }
    }
}

#Preview {
    ProfilePhotoSelectorView()
}
