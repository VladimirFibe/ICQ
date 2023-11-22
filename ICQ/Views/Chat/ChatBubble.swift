import SwiftUI

struct ChatBubble: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
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
  func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
    clipShape(ChatBubble(radius: radius, corners: corners))
  }
}

#Preview {
    Text("Hello")
        .padding()
        .background(.gray)
        .cornerRadius(10, corners: [.bottomLeft, .topLeft, .topRight])
}
