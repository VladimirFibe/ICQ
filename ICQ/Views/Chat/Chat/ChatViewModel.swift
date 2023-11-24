import Foundation
import Firebase
import FirebaseFirestoreSwift

@MainActor
final class ChatViewModel: ObservableObject {
    @Published var messages: [Message] = []
    let friendUid: String
    let friendName: String
    let friendUrl: String
    init(recent: Recent) {
        friendUid = recent.id ?? ""
        friendName = recent.uid
        friendUrl = recent.avatarLink
    }
    func getMessages() {
        messages = mockMessages
    }

    func sendMessage(_ text: String) {
        guard let me = AuthenticationViewModel.shared.person, 
        let currentUid = me.id else { return }

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

        data["uid"] = me.fullname
        data["avatarLink"] = me.avatarLink
        COLLECTION_MESSAGES
          .document(friendUid)
          .collection("recents")
          .document(currentUid)
          .setData(data)

        data["uid"] = me.id
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
