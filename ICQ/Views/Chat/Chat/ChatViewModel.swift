import Foundation
import Firebase
import FirebaseFirestoreSwift

@MainActor
final class ChatViewModel: ObservableObject {
    @Published var messages: [Message] = []
    let friendUid: String
    let friendName: String
    let friendUrl: String
    let currentUid: String
    let currentName: String
    let currentUrl: String
    init(recent: Recent) {
        friendUid = recent.id ?? ""
        friendName = recent.uid
        friendUrl = recent.avatarLink
        guard let person = AuthenticationViewModel.shared.person, let id = person.id
        else { fatalError("Where current person?")}
        currentUid = id
        currentName = person.fullname
        currentUrl = person.avatarLink
        fetchMessages()
    }

    func fetchMessages() {
        let query = COLLECTION_MESSAGES
            .document(currentUid)
            .collection(friendUid)
            .order(by: "timestamp", descending: false)

        query.addSnapshotListener { snapshot, _ in
            guard let changes = snapshot?.documentChanges.filter({ $0.type == .added }) else { return }
            let messages = changes.compactMap { try? $0.document.data(as: Message.self)}
            self.messages.append(contentsOf: messages)
        }
    }

    func sendMessage(_ text: String) {
        let currentRef = COLLECTION_MESSAGES
          .document(currentUid)
          .collection(friendUid)
          .document()

        let messageId = currentRef.documentID

        var data: [String: Any] = [
          "text": text,
          "read": false,
          "uid": friendUid,
          "timestamp": Timestamp(date: Date()),
        ]
        currentRef.setData(data)

        data["uid"] = friendName
        data["avatarLink"] = friendUrl
        COLLECTION_MESSAGES
            .document(currentUid)
            .collection("recents")
            .document(friendUid)
            .setData(data)

        data["uid"] = currentName
        data["avatarLink"] = currentUrl
        COLLECTION_MESSAGES
          .document(friendUid)
          .collection("recents")
          .document(currentUid)
          .setData(data)

        data["uid"] = currentUid
        COLLECTION_MESSAGES
          .document(friendUid)
          .collection(currentUid)
          .document(messageId)
          .setData(data)
    }
}

var mockMessages: [Message] {
    [
        .init(text: "А дальше как будет?"),
        .init(avatarLink: nil, text: """
              А так вот и будет.
              Тревожное небо не рухнет на плечи.
              Привычно потянутся серые будни,
              И в них,
              Словно праздники,
              Редкие встречи.
              Как праздники горькие,
              С мутным похмельем -
              Но все-таки праздники,
              Все же не будни.
              Веселье - как пропасть,
              Как горечь - веселье...
              """),
        .init(text: "И вечно так будет?"),
        .init(avatarLink: nil, text: "И вечно так будет."),
        .init(text: "А может, случится не так, а иначе?"),
        .init(avatarLink: nil, text: """
              Да, может, все будет совсем по-другому!
              Подарят нам ключ от пустующей дачи,
              На даче знакомых мы будем как дома.
              Нас будут встречать онемевшие птицы,
              Замерзшая печка, на стенке двустволка.
              """),
        .init(text: "И снова таиться?"),
        .init(avatarLink: nil, text: "И снова таиться."),
        .init(text: "И долго так будет?"),
        .init(avatarLink: nil, text: "Не знаю...\nНе долго...")
    ]
}
