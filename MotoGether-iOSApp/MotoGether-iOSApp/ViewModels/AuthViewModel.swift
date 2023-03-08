//
//  UserStateViewModel.swift
//  MotoGether-iOSApp
//
//  Created by Blaž Čerpnjak on 08/03/2023.
//

import Foundation

enum AuthError: Error {
    case signInError, signUpError, signOutError
}

@MainActor
class AuthViewModel: ObservableObject {
    @Published var showSignUpScreen = true
    @Published var isAuthenticated = false
    @Published var isLoading = false
    
    func signIn(username: String, password: String) async -> Result<Bool, AuthError> {
        isLoading = true
        
        do {
            try await Task.sleep(nanoseconds: 1_500_000_000)
            
            if username == "" || password == "" {
                throw AuthError.signInError
            }
            
            if username != "Demo" || password != "1234" {
                throw AuthError.signInError
            }
            
            isAuthenticated = true
            isLoading = false
            return .success(true)
        } catch {
            isLoading = false
            return .failure(.signInError)
        }
    }
    
    func signUp(username: String, password: String) async -> Result<Bool, AuthError> {
        isLoading = true
        
        do {
            try await Task.sleep(nanoseconds: 1_000_000_000)
            
            if username == "" || password == "" {
                throw AuthError.signUpError
            }
            
            isAuthenticated = true
            isLoading = false
            return .success(true)
        } catch {
            isLoading = false
            return .failure(.signUpError)
        }
    }
    
    func signOut() async -> Result<Bool, AuthError> {
        isLoading = true
        
        do {
            try await Task.sleep(nanoseconds: 1_000_000_000)
            isAuthenticated = false
            isLoading = false
            return .success(true)
        } catch {
            isLoading = false
            return .failure(.signOutError)
        }
    }
    
    func showSignUpScreen(visible: Bool) {
        showSignUpScreen = visible
    }
}
