//
//  RegistrationView.swift
//  ThreadsClone
//
//  Created by Isidro Chávez on 2024-05-15.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject var viewModel = RegistrationViewModel()
   
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        VStack{
            
                Spacer()
                
                Image("threads-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                
                VStack {
                    TextField("Enter your email", text: $viewModel.email)
                        .textInputAutocapitalization(.never)
                        .modifier(ThreadsTextFieldModifier())
                    
                    SecureField("Enter your password", text: $viewModel.password)
                        .modifier(ThreadsTextFieldModifier())
                    
                    TextField("Enter your fullname", text: $viewModel.fullname)
                        .modifier(ThreadsTextFieldModifier())
                
                    TextField("Enter your username", text: $viewModel.username)
                        .modifier(ThreadsTextFieldModifier())
                        .textInputAutocapitalization(.never)
                }
            Button {
                Task { try await viewModel.createUser()}
            }label: {
                Text("Sing Up")
                    .modifier(ThreadsButtonModifier())
            }
            .padding(.vertical)
            
            Spacer()
            
            Divider()
            
            Button {
                dismiss()
                
            }label: {
                HStack(spacing: 3){
                    Text("Alreadey have an account?")
                    
                    Text("Sign in")
                        .fontWeight(.semibold)
                }
                .foregroundStyle(.black)
                .font(.footnote)
            }
        }
    }
}

#Preview {
    RegistrationView()
}
