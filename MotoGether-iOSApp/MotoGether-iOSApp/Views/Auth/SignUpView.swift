//
//  SignUpView.swift
//  MotoGether-iOSApp
//
//  Created by Blaž Čerpnjak on 08/03/2023.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var email: String = ""
    @State private var error = false
    
    var body: some View {
        VStack {
            if (authViewModel.isLoading) {
                ProgressView()
                    .padding()
            } else {
                Text("Join Us")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                TextField("Username", text: $username)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(.thinMaterial.opacity(0.5))
                    .cornerRadius(10)
                
                TextField("Email", text: $email)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(.thinMaterial.opacity(0.5))
                    .cornerRadius(10)
                
                SecureField("Password", text: $password)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(.thinMaterial.opacity(0.5))
                    .cornerRadius(10)
                
                SecureField("Confirm password", text: $confirmPassword)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(.thinMaterial.opacity(0.5))
                    .cornerRadius(10)
                
                Button("Sign Up") {
                    signUp(username: username, password: password)
                }
                .foregroundColor(.white)
                .fontWeight(.semibold)
                .frame(width: 300, height: 50)
                .background(Color.blue)
                .cornerRadius(10)
                .padding()
                
                if error {
                    Text("Inputs cannot be empty.")
                        .padding()
                }
                
                HStack(alignment: .center) {
                    Text("Already have an account?")
                    Button("Login") {
                        authViewModel.showSignUpScreen(visible: false)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        .background(Color.MainBackgroundColor)
    }
    
    private func signUp(username: String, password: String) {
        Task {
            let result = await authViewModel.signUp (
                username: username, password: password
            )
            
            switch result {
            case .failure(_):
                error = true
            case .success(_):
                error = false
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .environmentObject(AuthViewModel())
    }
}
