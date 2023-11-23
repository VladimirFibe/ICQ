import SwiftUI

struct ChatsView: View {
    @State private var show = false
    @State private var selectedPerson: Person?
    @State private var path = [String]()
    @State private var chats: [String] = ["Vladimir", "Katya", "Masha", "Nastya", "Semyon", "Margarita", "Violetta"]
    var body: some View {
        NavigationStack(path: $path) {
            List(chats, id: \.self) { chat in
                NavigationLink(value: chat) {
                    ChatsCell(chat: chat)
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
            .navigationDestination(for: String.self) { chat in
                ChatView(person: Person(username: chat))
            }
        }
        .sheet(isPresented: $show, onDismiss: {
            if let person = selectedPerson {
                let chat = person.username
                chats.append(chat)
                path = [chat]
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
