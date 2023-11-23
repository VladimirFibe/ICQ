import SwiftUI
import FirebaseAuth

struct AuthenticationView: View {
    @ObservedObject var viewModel = AuthenticationViewModel()
    var body: some View {
        switch viewModel.authenticationState {
        case .unauthenticated:  LoginView()
        case .authenticating:   ProgressView()
        case .authenticated:    
            MainTabView()
                .sheet(isPresented: $viewModel.addPhoto) {
                    ProfilePhotoSelectorView()
                }
        }
        
    }
}

#Preview {
    AuthenticationView()
}
