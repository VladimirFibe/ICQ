import SwiftUI

struct MessageView: View {
    let viewModel: MessageViewModel
    var body: some View {
        HStack {
            if let url = viewModel.avatarLink {
                VStack(alignment: .leading) {
                    if let name = viewModel.name {
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
                    .padding(.leading, 100)
            }
        }
    }
}

#Preview {
    MessageView(viewModel: MessageViewModel(message: Message()))
        .padding(.horizontal)
}
