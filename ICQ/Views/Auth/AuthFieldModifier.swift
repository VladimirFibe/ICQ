import SwiftUI

struct AuthFieldModifier: ViewModifier {
    let icon: String
    func body(content: Content) -> some View {
        VStack(spacing: 16.0) {
            HStack {
                Image(systemName: icon)
                    .imageScale(.large)
                content
            }
            Divider()
        }
    }
}

#Preview {
    TextField("Email", text: .constant(""))
        .modifier(AuthFieldModifier(icon: "lock"))
        .padding(.horizontal)
}
