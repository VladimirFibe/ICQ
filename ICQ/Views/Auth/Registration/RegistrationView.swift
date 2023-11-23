import SwiftUI

struct RegistrationView: View {
    @ObservedObject var viewModel = RegistrationViewModel()
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack(spacing: 32) {
            // Header
            AuthHeader(title: "Get started", subtitle: "Create your account")

            // TextFields
            VStack(spacing: 30) {
                TextField("Email", text: $viewModel.email)
                    .modifier(AuthFieldModifier(icon: "envelope"))
                TextField("Username", text: $viewModel.username)
                    .modifier(AuthFieldModifier(icon: "person"))
                TextField("Full Name", text: $viewModel.fullname)
                    .modifier(AuthFieldModifier(icon: "person"))
                SecureField("Password", text: $viewModel.password)
                    .modifier(AuthFieldModifier(icon: "lock"))
            }
            // Sign in button
            Button(action: viewModel.register) {
                Text("Sign Up")
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
            Button {
                dismiss()
            } label: {
                Text("Already have an account? ") + Text("Sign in").bold()
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 32)
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    NavigationStack {
        RegistrationView()
    }
}
