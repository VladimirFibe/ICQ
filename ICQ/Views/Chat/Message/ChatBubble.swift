import SwiftUI

struct ChatBubble: Shape {
    var radius: CGFloat = .infinity
    var isFromCurrentUser = false
    var corners: UIRectCorner {
        isFromCurrentUser ? [.bottomLeft, .topLeft, .topRight]
        : [.bottomRight, .topLeft, .topRight]
    }
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, isFromCurrentUser: Bool = false) -> some View {
    clipShape(ChatBubble(radius: radius, isFromCurrentUser: isFromCurrentUser))
  }
}

#Preview {
    Text("Hello")
        .padding()
        .background(.gray)
        .cornerRadius(16, isFromCurrentUser: true)
}
