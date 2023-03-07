//
//  CustomTabBar.swift
//  MotoGether-iOSApp
//
//  Created by Blaž Čerpnjak on 07/03/2023.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case map = "map"
    case bell = "bell"
    case plus = "plus.diamond"
    case person = "person"
    case people = "person.2"
}

struct CustomTabBar: View {
    @Binding var selectedTab: Tab
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    
    private var tabColor: Color {
        switch selectedTab {
        case .map:
            return .blue
        case .plus:
            return .green
        case .person:
            return .indigo
        case .people:
            return .green
        case .bell:
            return .orange
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Image(systemName: selectedTab == tab && selectedTab != Tab.plus
                          ? fillImage : tab.rawValue)
                        .scaleEffect(selectedTab == tab ? 1.25 : 1.0)
                        .foregroundColor(selectedTab == tab ? tabColor : .gray)
                        .font(.system(size: tab == Tab.plus ? 30 : 22))
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.1)) {
                                selectedTab = tab
                            }
                        }
                    Spacer()
                }
            }
            .frame(width: nil, height: 60)
            .background(.thinMaterial)
            .cornerRadius(10)
            .padding()
        }
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.map))
    }
}
