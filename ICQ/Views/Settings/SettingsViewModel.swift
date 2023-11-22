//
//  SettingsViewModel.swift
//  ICQ
//
//  Created by Vladimir Fibe on 22.11.2023.
//

import Foundation

final class SettingsViewModel: ObservableObject {
    func logout() {
        do {
            try FirebaseClient.shared.signOut()
        } catch {
            print(error.localizedDescription)
        }
    }
}
