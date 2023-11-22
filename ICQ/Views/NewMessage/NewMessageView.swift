import SwiftUI

struct NewMessageView: View {
    @Environment(\.dismiss) var dismiss
    @State private var text = ""
    var filtered: [String] {
        let _ = "Name".localizedCaseInsensitiveContains(text)
        return []
    }
    var body: some View {
        NavigationStack {
            List(0 ..< 5) { item in
                SettingsHeaderView()
                    .onTapGesture {
                        dismiss()
                    }
            }
            .searchable(text: $text, prompt: Text("Users"))
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    NewMessageView()
}
