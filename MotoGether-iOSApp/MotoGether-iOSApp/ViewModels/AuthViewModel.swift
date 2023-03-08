//
//  UserStateViewModel.swift
//  MotoGether-iOSApp
//
//  Created by Blaž Čerpnjak on 08/03/2023.
//

import Foundation

enum AuthError: Error{
    case signInError, signOutError
}

@MainActor
class AuthViewModel: ObservableObject {
    @Published var isAuthenticated = false
    @Published var isLoading = false
    
    func signIn(username: String, password: String) async -> Result<Bool, AuthError> {
        isLoading = true
        
        do {
            try await Task.sleep(nanoseconds: 2_000_000_000)
            isAuthenticated = true
            isLoading = false
            return .success(true)
        } catch {
            isLoading = false
            return .failure(.signInError)
        }
    }
    
    func signOut() async -> Result<Bool, AuthError> {
        isLoading = true
        
        do {
            try await Task.sleep(nanoseconds: 2_000_000_000)
            isAuthenticated = false
            isLoading = false
            return .success(true)
        } catch {
            isLoading = false
            return .failure(.signOutError)
        }
    }
}
