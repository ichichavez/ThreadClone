//
//  User.swift
//  ThreadsClone
//
//  Created by Isidro Chávez on 2024-05-21.
//

import Foundation


struct User: Identifiable, Codable, Hashable {
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: String?
    var bio: String?
    
}
