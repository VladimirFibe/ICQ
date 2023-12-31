import SwiftUI

struct ChatsView: View {
    @State private var show = false
    @State private var selectedPerson: Person?
    @State private var path = [Recent]()
    @ObservedObject var viewModel = ChatsViewModel()
    var body: some View {
        NavigationStack(path: $path) {
            List(viewModel.recents) { recent in
                NavigationLink(value: recent) {
                    ChatsCell(recent: recent)
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .overlay(alignment: .bottomTrailing) {
                Button {
                    show.toggle()
                } label: {
                    Image(systemName: "square.and.pencil")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                        .padding()
                        .background(.blue)
                        .tint(.white)
                        .clipShape(Circle())
                        .padding()
                }
            }
            .navigationDestination(for: Recent.self) { recent in
                ChatView(viewModel: ChatViewModel(recent: recent))
            }
        }
        .sheet(isPresented: $show, onDismiss: {
            if let person = selectedPerson {
                let recent = Recent(id: person.id, uid: person.username, avatarLink: person.avatarLink, text: "")
                path = [recent]
                selectedPerson = nil
            }
        }) {
            NewMessageView(selectedPerson: $selectedPerson)
        }
    }
}

#Preview {
    ChatsView()
}
