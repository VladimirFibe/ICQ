import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel = LoginViewModel()
    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                // Header
                AuthHeader(title: "Hello", subtitle: "Welcome Back")
                // TextFields
                VStack(spacing: 30) {
                    TextField("Email", text: $viewModel.email)
                        .modifier(AuthFieldModifier(icon: "envelope"))
                    SecureField("Password", text: $viewModel.password)
                        .modifier(AuthFieldModifier(icon: "lock"))
                }
                // Forgot password
                NavigationLink {
                    Text("Passord")
                } label: {
                    Text("Forgot password")
                        .font(.system(size: 13, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                // Sign in button
                Button(action: viewModel.login) {
                    Text("Sign in")
                        .font(.headline)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .controlSize(.large)
                .padding(.horizontal, 20)
                .shadow(color: .gray, radius: 10, x: 0, y: 0)

                Spacer()
                // Sign Up link
                NavigationLink {
                    RegistrationView()
                } label: {
                    Text("Don't have an account? ") + Text("Sign up").bold()
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 32)
        }
    }
}

#Preview {
    LoginView()
}
