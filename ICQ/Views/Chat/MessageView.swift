import SwiftUI

struct MessageView: View {
    let viewModel: MessageViewModel
    var body: some View {
        HStack {
            if let url = viewModel.image {
                VStack(alignment: .leading) {
                    if let name = viewModel.message.name {
                        Text(name)
                            .foregroundColor(.gray)
                            .font(.system(size: 14))
                            .padding(.leading, 44)
                    }
                    HStack(alignment: .bottom, spacing: 10) {
                        AvatarView(url: url, width: 32)
                        Text(viewModel.text)
                            .padding(12)
                            .background(Color(.systemGray5))
                            .font(.system(size: 15))
                            .cornerRadius(16, isFromCurrentUser: false)
                    }
//                    .padding(.leading)
                    .padding(.trailing, 80)
                }
                Spacer()
            } else {
                Spacer()
                Text(viewModel.text)
                    .padding(12)
                    .background(Color(.systemBlue))
                    .foregroundStyle(.white)
                    .font(.system(size: 15))
                    .cornerRadius(16, isFromCurrentUser: true)
//                    .padding(.trailing)
                    .padding(.leading, 100)
            }
        }
    }
}

#Preview {
    MessageView(viewModel: MessageViewModel(message: Message(profileImageUrl: nil)))
}
