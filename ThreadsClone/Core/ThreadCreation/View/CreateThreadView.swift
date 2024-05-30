//
//  CreateThreadView.swift
//  ThreadsClone
//
//  Created by Isidro Chávez on 2024-05-19.
//

import SwiftUI
struct CreateThreadView: View {
    @StateObject var viewModel = CreateThreadViewModel()
    @State private var caption = ""
    @Environment (\.dismiss) var dismiss
    
    private var user: User? {
        return UserService.shared.currentUser
    }
    
    var body: some View {
                NavigationStack{
                    VStack{
                        HStack(alignment: .top){
                            CircularProfileImageView(user: user, size: .small)
                            
                            VStack(alignment: .leading, spacing: 4){
                                Text(user?.username ?? "")
                                    .fontWeight(.semibold)
                                
                                TextField("Start a thread...", text: $caption)
                            }
                            .font(.footnote)
                            
                            Spacer()
                            
                            if !caption.isEmpty{
                                Button{
                                    caption = ""
                                } label: {
                                    Image(systemName: "xmark")
                                        .resizable()
                                        .frame(width: 12, height: 12)
                                        .foregroundStyle(.gray)
                                }
                            }
                        }
                        Spacer()
                        
                    }
                    .padding()
                    .navigationTitle("New Thread")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar{
                        ToolbarItem(placement: .topBarLeading){
                            Button("Cancel"){
                                dismiss()
                            }
                        }
                        ToolbarItem(placement: .topBarTrailing){
                            Button("Post"){
                                Task { 
                                    try await viewModel.uploadThread(caption:caption)
                                    dismiss()
                                }
                                
                            }
                            .opacity(caption.isEmpty ? 0.5 : 1.0)
                            .disabled(caption.isEmpty)
                            .fontWeight(.semibold)
                        }
                        
                    }
                    .font(.subheadline)
                    .foregroundStyle(.black)
                }
         }
    }
#Preview {
    CreateThreadView()
}
