//
//  AuthHeader.swift
//  ICQ
//
//  Created by Vladimir Fibe on 21.11.2023.
//

import SwiftUI

struct AuthHeader: View {
    let title: String
    let subtitle: String
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
            Text(subtitle)
                .foregroundStyle(.blue)
        }
        .font(.largeTitle.bold())
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview {
    AuthHeader(title: "Get started", subtitle: "Create your account")
}
