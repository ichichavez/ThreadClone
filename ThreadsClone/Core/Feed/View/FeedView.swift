//
//  FeedView.swift
//  ThreadsClone
//
//  Created by Isidro Chávez on 2024-05-15.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVStack{
                    ForEach(viewModel.threads){ thread in
                        ThreadCell(thread: thread)
                        
                    }
                }
            }
            .refreshable {
                Task { try await viewModel.fetchThreads()}
            }
            .navigationTitle("Threads")
            .navigationBarTitleDisplayMode(.inline)
            .scrollIndicators(.never)
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing){
                Button{
                    
                } label: {
                    Image(systemName: "arrow.counterclockwise")
                        .foregroundStyle(Color(.black))
                }
            }
        }
    }
}

#Preview {
    NavigationStack{
        FeedView()
    }
}
