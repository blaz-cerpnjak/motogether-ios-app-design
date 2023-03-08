//
//  MotoGether_iOSAppApp.swift
//  MotoGether-iOSApp
//
//  Created by Blaž Čerpnjak on 06/03/2023.
//

import SwiftUI

@main
struct MotoGether_iOSAppApp: App {
    @StateObject var authViewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ApplicationSwitcher()
            }
            .navigationViewStyle(.stack)
            .environmentObject(authViewModel)
        }
    }
}

struct ApplicationSwitcher: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        if authViewModel.isAuthenticated {
            ContentView()
        } else {
            if authViewModel.showSignUpScreen {
                SignUpView()
            } else {
                SignInView()
            }
        }
    }
}
