import Foundation

final class ChatViewModel: ObservableObject {
    @Published var messages: [Message] = []
    var mockMessages: [Message] {
        [
            .init(text: "А дальше как будет?"),
            .init(profileImageUrl: nil, text: """
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
            .init(profileImageUrl: nil, text: "И вечно так будет."),
            .init(text: "А может, случится не так, а иначе?"),
            .init(profileImageUrl: nil, text: """
                  Да, может, все будет совсем по-другому!
                  Подарят нам ключ от пустующей дачи,
                  На даче знакомых мы будем как дома.
                  Нас будут встречать онемевшие птицы,
                  Замерзшая печка, на стенке двустволка.
                  """),
            .init(text: "И снова таиться?"),
            .init(profileImageUrl: nil, text: "И снова таиться."),
            .init(text: "И долго так будет?"),
            .init(profileImageUrl: nil, text: "Не знаю...\nНе долго...")
        ]
    }

    func getMessages() {
        messages = mockMessages
    }
}
