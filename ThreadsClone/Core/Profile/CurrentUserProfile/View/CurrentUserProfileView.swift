//
//  CurrentUserProfileView.swift
//  ThreadsClone
//
//  Created by Isidro Chávez on 2024-05-24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    @StateObject var viewModel = CurrentUserProfileViewModel()
    @State private var showEditProfile = false
    
    
    
    private var currentUser: User? {
        return viewModel.currentUser
    }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                //bio and stats
                VStack (spacing: 20){
                    
                        ProfileHeaderView(user: currentUser)
                    
                    
                    Button {
                        showEditProfile.toggle()
                    } label: {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                            .frame(width: 352, height: 32)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .overlay{
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color(.systemGray4), lineWidth: 1)
                            }
                    }
                    
                    //user content list view
                    if let user = currentUser {
                        UserContentListView(user: user)
                    }
                }
            }
            .sheet(isPresented: $showEditProfile, content: {
                if let user = currentUser {
                    EditProfileView(user: user)
                }
                    
            })
            .toolbar {
                ToolbarItem(placement: .topBarTrailing){
                    Button {
                        AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "line.3.horizontal")
                    }
                    .tint(.black)
                }
            }
            .scrollIndicators(.never)
            .padding(.horizontal)
        }
    }
}

#Preview {
    CurrentUserProfileView()
}
