//
//  LoginViewModel.swift
//  ThreadsClone
//
//  Created by Isidro Chávez on 2024-05-21.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""

    
    @MainActor
    func login() async throws {
        try await AuthService.shared.login(withEmail: email,password: password)
         
    }
}
