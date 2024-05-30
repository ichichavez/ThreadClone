//
//  ProfileView.swift
//  ThreadsClone
//
//  Created by Isidro Chávez on 2024-05-15.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    
    var body: some View {
        ScrollView{
            //bio and stats
            VStack (spacing: 20){
                
                ProfileHeaderView(user: user)
                
                Button {
                    
                } label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 352, height: 32)
                        .background(.black)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                //user content list view
                UserContentListView(user: user)
            }
        }
       
        .navigationBarTitleDisplayMode(.inline)
        .scrollIndicators(.never)
        .padding(.horizontal)
    }
}

#Preview {
    ProfileView(user: User(id: NSUUID().uuidString, fullname: "Max Verstappen", email: "max@gmail.com", username: "maxverstappen1"))
}
