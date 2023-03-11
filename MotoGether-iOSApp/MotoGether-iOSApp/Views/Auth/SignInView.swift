//
//  LoginView.swift
//  MotoGether-iOSApp
//
//  Created by Blaž Čerpnjak on 08/03/2023.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var error = false
    
    var body: some View {
        VStack {
            if (authViewModel.isLoading) {
                ProgressView()
                    .padding()
            } else {
                Text("Login")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                TextField("Username", text: $username)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(.thinMaterial.opacity(0.5))
                    .cornerRadius(10)
                
                SecureField("Password", text: $password)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(.thinMaterial.opacity(0.5))
                    .cornerRadius(10)
                
                Button("Login") {
                    signIn(username: username, password: password)
                }
                .foregroundColor(.white)
                .fontWeight(.semibold)
                .frame(width: 300, height: 50)
                .background(Color.PrimaryColor)
                .cornerRadius(10)
                .padding()
                
                if error {
                    Text("Wrong username or password.")
                        .padding()
                }
                
                HStack(alignment: .center) {
                    Text("You don't have an account?")
                    Button("Join Us") {
                        authViewModel.showSignUpScreen(visible: true)
                    }
                    .foregroundColor(Color.PrimaryColor)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        .background(Color.MainBackgroundColor)
    }
    
    private func signIn(username: String, password: String) {
        Task {
            let result = await authViewModel.signIn (
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
            .environmentObject(AuthViewModel())
    }
}
