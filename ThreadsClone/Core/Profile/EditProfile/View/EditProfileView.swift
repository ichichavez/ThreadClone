//
//  EditProfileView.swift
//  ThreadsClone
//
//  Created by Isidro Chávez on 2024-05-16.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    let user: User
    
    @State private var bio = ""
    @State private var link = ""
    @State private var isPrivateProfile = false
    @Environment (\.dismiss) var dismiss
    @StateObject var viewModel = EditProfileViewModel()
    
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color(.systemGroupedBackground)
                    .edgesIgnoringSafeArea([.bottom, .horizontal])
                
                VStack{
                    //name and profile image
                    HStack{
                        VStack{
                            Text("Name")
                                .fontWeight(.semibold)
                            
                            Text(user.fullname)
                            
                        }
                        Spacer()
                        
                        PhotosPicker(selection: $viewModel.selectedItem){
                            if let image = viewModel.profileImage {
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                            } else {
                                CircularProfileImageView(user: user, size: .small)
                            }
                        }
                    }
                    Divider()
                    
                    //bio field
                    VStack(alignment: .leading){
                        Text("Bio")
                            .fontWeight(.semibold)
                        
                        TextField("Enter your bio...", text: $bio, axis: .vertical)
                    }
                    Divider()
                    
                    //link field
                    VStack(alignment: .leading){
                        Text("Link")
                            .fontWeight(.semibold)
                        
                        TextField("Enter your link...", text: $link, axis: .vertical)
                    }
                
                    Divider()
                    
                    Toggle("Private profile", isOn: $isPrivateProfile)
                    
                    Divider()
                }
                .font(.footnote)
                .padding()
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                }
                .padding()
                
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel"){
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundStyle(.black)
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done"){
                        Task {
                            try await viewModel.updateUserData()
                            dismiss()
                        }
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                }
                
            }
        }
    }
}

#Preview {
    EditProfileView(user: User(id: NSUUID().uuidString, fullname: "Max Verstappen", email: "max@gmail.com", username: "maxverstappen1"))
}
