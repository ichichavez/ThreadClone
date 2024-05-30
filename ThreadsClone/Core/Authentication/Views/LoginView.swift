//
//  LoginView.swift
//  ThreadsClone
//
//  Created by Isidro Chávez on 2024-05-13.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack{
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
                }
                NavigationLink {
                    Text("Forgot password")
                } label: {
                    Text ("Forgot password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                        .padding(.trailing, 28)
                        .foregroundStyle(.black)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                Button {
                    Task{ try await viewModel.login()}
                }label: {
                    Text("Login")
                        .modifier(ThreadsButtonModifier())
                }
                Spacer()
                
                Divider()
                
                NavigationLink {
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label :{
                    HStack(spacing: 3){
                        Text("Don't have an account?")
                        
                        Text("Sign up")
                            .fontWeight(.semibold)
                        
                    }
                    .foregroundStyle(.black)
                    .font(.footnote)
                    
                }
                .padding(.vertical, 16)
            }
        }
    }
}

#Preview {
    LoginView()
}
