//
//  MotoGether_iOSAppApp.swift
//  MotoGether-iOSApp
//
//  Created by Blaž Čerpnjak on 06/03/2023.
//

import SwiftUI

@main
struct MotoGether_iOSAppApp: App {
    @StateObject var userStateViewModel = UserStateViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ApplicationSwitcher()
            }
            .navigationViewStyle(.stack)
            .environmentObject(userStateViewModel)
        }
    }
}

struct ApplicationSwitcher: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if (viewModel.isAuthenticated) {
            ContentView()
        } else {
            LoginView()
        }
    }
}
