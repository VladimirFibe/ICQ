import SwiftUI
import FirebaseAuth

struct ContentView: View {
    var body: some View {
        if Auth.auth().currentUser == nil {
            LoginView()
        } else {
            MainTabView()
        }
    }
}

#Preview {
    ContentView()
}
