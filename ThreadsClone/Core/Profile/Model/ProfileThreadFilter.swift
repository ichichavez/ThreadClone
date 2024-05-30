//
//  ProfileThreadFilter.swift
//  ThreadsClone
//
//  Created by Isidro Chávez on 2024-05-15.
//

import Foundation

enum ProfileThreadFilter: Int, CaseIterable, Identifiable {
    case threads
    case replies
   
    var title: String {
        switch self {
        case .threads: return "Threads"
        case .replies: return "Replies"
        }
    }
    
    var id: Int { return self.rawValue }
}
