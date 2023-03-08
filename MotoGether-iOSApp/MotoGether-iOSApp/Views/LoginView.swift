//
//  LoginView.swift
//  MotoGether-iOSApp
//
//  Created by Blaž Čerpnjak on 08/03/2023.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var error = false
    
    var body: some View {
        VStack {
            if (viewModel.isLoading) {
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
                    login(username: username, password: password)
                }
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .background(Color.blue)
                .cornerRadius(10)
                .padding()
                
                if error {
                    Text("Wrong username or password.")
                }
            }
        }
    }
    
    private func login(username: String, password: String) {
        Task {
            await viewModel.signIn (
                username: username, password: password
            )
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
