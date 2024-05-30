//
//  ContentView.swift
//  ThreadsClone
//
//  Created by Isidro Chávez on 2024-05-13.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                ThreadsTabView()
            }else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
