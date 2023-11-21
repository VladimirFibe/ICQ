import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                VStack(alignment: .leading) {
                    Text("Hello")
                    Text("Welcome Back")
                        .foregroundStyle(.blue)
                }
                .font(.largeTitle.bold())
                .frame(maxWidth: .infinity, alignment: .leading)

                VStack(spacing: 20) {
                    TextField("Email", text: $email)
                        .modifier(AuthFieldModifier(icon: "envelope"))
                    SecureField("Password", text: $password)
                        .modifier(AuthFieldModifier(icon: "lock"))
                }

                NavigationLink {
                    Text("Passord")
                } label: {
                    Text("Forgot password")
                        .font(.system(size: 13, weight: .semibold))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }

                Button(action: {}) {
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

                NavigationLink {
                    Text("Register")
                } label: {
                    Text("Don't have an account? ") + Text("Sign up").bold()
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 32)
        }
    }
}

#Preview {
    LoginView()
}
