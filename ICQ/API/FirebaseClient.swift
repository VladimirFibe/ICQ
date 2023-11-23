import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseStorage

final class FirebaseClient {
    static let shared = FirebaseClient()
    private init() {}
    var person: Person? = nil
    var avatarImage: UIImage?

    func createPerson(with email: String, uid: String, username: String, fullname: String) throws {
        person = Person(username: username, email: email, fullname: fullname)
        try reference(.persons).document(uid).setData(from: person)
    }

    func fetchPerson() async throws {
        guard let id = Auth.auth().currentUser?.uid else { return }
        let querySnapshot = try await reference(.persons)
            .document(id)
            .getDocument()
        person = try? querySnapshot.data(as: Person.self)
        fetchAvatarImage()
    }

    func fetchAvatarImage() {
        let link = person?.avatarLink ?? ""
        if let url = URL(string: link) {
            let downloadQueue = DispatchQueue(label: "imageDownloadQueue")
            downloadQueue.async {
                if let data = NSData(contentsOf: url) {
                    DispatchQueue.main.async {
                        self.avatarImage = UIImage(data: data as Data)
                    }
                }
            }
        }
    }

    func updateCurrentPerson() throws {
        guard let uid = person?.id else { return }
        try reference(.persons)
            .document(uid)
            .setData(from: person)
    }

    func reference(_ collectionReference: FCollectionReference) -> CollectionReference {
        Firestore.firestore().collection(collectionReference.rawValue)
    }

    enum FCollectionReference: String {
        case persons
        case recent
    }

    func chatRoomIdFrom(firstId: String, secondId: String) -> String {
        let value = firstId.compare(secondId).rawValue
        return value < 0 ? firstId + secondId : secondId + firstId
    }

    func register(
        withEmail email: String,
        password: String, username:
        String = "",
        fullname: String = ""
    ) async throws {
        let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
        let uid = authResult.user.uid
        try createPerson(with: email, uid: uid, username: username, fullname: fullname)
        try await authResult.user.sendEmailVerification()
    }

    func login(withEmail email: String, password: String) async throws -> Bool {
        let result = try await Auth.auth().signIn(withEmail: email, password: password)
        return result.user.isEmailVerified
    }

    func sendEmailVerification() async throws {
        try await Auth.auth().currentUser?.reload()
        try await Auth.auth().currentUser?.sendEmailVerification()
    }

    func resetPassword(for email: String) async throws {
        try await Auth.auth().sendPasswordReset(withEmail: email)
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
        person = nil
    }

    func uploadAvatarImage(_ image: UIImage) async throws {
        guard let id = person?.id,
            let imageData = image.jpegData(compressionQuality: 0.6)
        else { return }
        let path = "/profile/\(id).jpg"
        let ref = Storage.storage().reference(withPath: path)
        let _ = try await ref.putDataAsync(imageData)
        let url = try await ref.downloadURL()
        person?.avatarLink = url.absoluteString
        try updateCurrentPerson()
    }
}
