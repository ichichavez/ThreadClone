//
//  RegistrationViewModel.swift
//  ThreadsClone
//
//  Created by Isidro Chávez on 2024-05-19.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    @Published var username = ""
    
    @MainActor
    func createUser() async throws {
       try await AuthService.shared.createUser(
            withEmail: email,
            password: password,
            fullname: fullname,
            username: username)
    }
}
