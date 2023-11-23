import SwiftUI
import Kingfisher

struct AvatarView: View {
    var url: String = "https://i.pinimg.com/736x/84/d4/b6/84d4b6b6302d87c8b21706c6347be558.jpg"
    var width = 64.0
    var body: some View {
        KFImage(URL(string: url))
            .resizable()
            .scaledToFill()
            .frame(width: width, height: width)
            .clipShape(Circle())
    }
}

#Preview {
    AvatarView(url: "https://i.pinimg.com/736x/84/d4/b6/84d4b6b6302d87c8b21706c6347be558.jpg")
}
