import SwiftUI

struct NewMessageView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel = NewMessageViewModel()
    @Binding var selectedPerson: Person?
    @State private var text = ""
    var filtered: [String] {
        let _ = "Name".localizedCaseInsensitiveContains(text)
        return []
    }

    var body: some View {
        NavigationStack {
            List(viewModel.persons) { person in
                HStack {
                    AvatarView(url: person.avatarLink)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(person.fullname)
                            .bold()
                        Text(person.status)
                            .foregroundStyle(.secondary)
                    }
                    .font(.system(size: 14))
                }
                .onTapGesture {
                    selectedPerson = person
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
    NewMessageView(selectedPerson: .constant(nil))
}
