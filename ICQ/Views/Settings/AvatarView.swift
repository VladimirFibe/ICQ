import SwiftUI

struct AvatarView: View {
    var url: String = "https://i.pinimg.com/736x/84/d4/b6/84d4b6b6302d87c8b21706c6347be558.jpg"
    var width = 64.0
    var body: some View {
        AsyncImage(url:  URL(string: url)) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(width: width, height: width)
                .clipShape(Circle())
        } placeholder: {
            ProgressView()
                .frame(width: width, height: width)
        }
    }
}

#Preview {
    AvatarView(url: "https://i.pinimg.com/736x/84/d4/b6/84d4b6b6302d87c8b21706c6347be558.jpg")
}
