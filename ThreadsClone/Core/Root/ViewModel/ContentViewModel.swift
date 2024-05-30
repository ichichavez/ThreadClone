//
//  ContentViewModel.swift
//  ThreadsClone
//
//  Created by Isidro Chávez on 2024-05-20.
//

import Foundation
import Combine
import Firebase

class ContentViewModel: ObservableObject{
    @Published var userSession: FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()
    init(){
        setupSuscribers()
    }
    
    private func setupSuscribers(){
        AuthService.shared.$userSession.sink { [weak self] userSession in
            self?.userSession = userSession
        }.store(in: &cancellables)
    }
}
