//
//  ContentView.swift
//  MotoGether-iOSApp
//
//  Created by Blaž Čerpnjak on 06/03/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .map
    
    init() {
        UITabBar.appearance().isHidden = true
        UINavigationBar.appearance().barTintColor = UIColor(named: "PrimaryColor")
        UINavigationBar.appearance().backgroundColor = UIColor(named: "PrimaryColor")
        UITableView.appearance().backgroundColor = UIColor(named: "MainBackgroundColor")
    }
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $selectedTab) {
                    ForEach(Tab.allCases, id: \.rawValue) { tab in
                        HStack {
                            switch tab {
                            case .map:
                                HomeView()
                            case .plus:
                                AddPathView()
                            case .person:
                                HomeView()
                            case .people:
                                HomeView()
                            case .bell:
                                HomeView()
                            }
                        }
                        .tag(tab)
                    }
                }
                .padding(.top, 80)
            }
            
            VStack {
                CustomTopBar()
                Spacer()
                CustomTabBar(selectedTab: $selectedTab)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
