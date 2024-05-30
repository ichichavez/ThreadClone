//
//  ExploreViewModel.swift
//  ThreadsClone
//
//  Created by Isidro Chávez on 2024-05-21.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User] ()
    
    init() {
        Task { try await fetchUser()   }
    }
    @MainActor
    private func fetchUser() async throws {
        self.users = try await UserService.fetchUsers()
    }
}
