//
//  ExploreView.swift
//  ThreadsClone
//
//  Created by Isidro Chávez on 2024-05-15.
//

import SwiftUI

struct ExploreView: View {
    @State private var searchText = ""
    @StateObject var viewModel = ExploreViewModel()
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack{
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            VStack{
                                UserCell(user: user)
                            }
                        }
                        .padding(.vertical, 4)
                        
                    }
                    
                }
            }
            .navigationDestination(for: User.self, destination: { user in
               ProfileView(user: user)
            })
            .tint(.black)
            .navigationTitle("Search")
            .searchable(text: $searchText ,prompt: "Search")
        }
    }
}

#Preview {
    ExploreView()
}
