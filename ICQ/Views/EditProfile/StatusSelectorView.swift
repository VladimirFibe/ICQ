import SwiftUI

struct StatusSelectorView: View {
    @Binding var selected: String
    @Environment(\.dismiss) var dismiss
    var body: some View {
        List(Status.allCases) { status in
            HStack {
                Text(status.rawValue)
                Spacer()
                if selected == status.rawValue {
                    Image(systemName: "checkmark")
                }
            }
            .onTapGesture {
                selected = status.rawValue
                dismiss()
            }
        }
        .navigationBarBackButtonHidden()
        .navigationTitle("Statuses")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        StatusSelectorView(selected: .constant("Available"))
    }
}
