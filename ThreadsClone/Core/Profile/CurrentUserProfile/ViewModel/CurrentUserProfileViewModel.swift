//
//  ProfileViewModel.swift
//  ThreadsClone
//
//  Created by Isidro Chávez on 2024-05-21.
//

import Foundation
import Combine
import PhotosUI
import SwiftUI

class CurrentUserProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        setupSubscribers()
    }
    
    private func setupSubscribers(){
        UserService.shared.$currentUser.sink { [ weak self ] user in
            self?.currentUser = user
            
        }.store(in: &cancellables)
    }
}
