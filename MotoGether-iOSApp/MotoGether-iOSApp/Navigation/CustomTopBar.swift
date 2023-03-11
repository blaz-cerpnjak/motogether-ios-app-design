//
//  CustomTopBar.swift
//  MotoGether-iOSApp
//
//  Created by Blaž Čerpnjak on 07/03/2023.
//

import SwiftUI

struct CustomTopBar: View {
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @State private var isDarkMode = false
    
    func setAppTheme() {
        isDarkMode = UserDefaultsUtils.shared.getDarkMode()
        changeDarkMode(state: isDarkMode)
    }
    
    func changeDarkMode(state: Bool) {
        (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first!.overrideUserInterfaceStyle = state ? .dark : .light
        UserDefaultsUtils.shared.setDarkMode(enable: state)
        isDarkMode = state
    }
    
    func toggleAppTheme() {
        changeDarkMode(state: !isDarkMode)
    }
 
    var ToggleThemeView: some View {
        Toggle("Dark Mode", isOn: $isDarkMode).onChange(of: isDarkMode) { (state)  in
            changeDarkMode(state: state)
        }.labelsHidden()
    }
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {}, label: {
                    Image(systemName: "line.3.horizontal")
                        .font(.title)
                        .frame(width: 30, height: 30)
                        .padding(10)
                        //.background(.thinMaterial)
                        .foregroundColor(Color.TextColorPrimary)
                        //.cornerRadius(8)
                })
                
                Spacer()
                
                Button(action: {
                    toggleAppTheme()
                }) {
                    Image(systemName: isDarkMode ? "sun.max.fill" : "moon.fill")
                        .foregroundColor(Color.TextColorPrimary)
                }
            }
            .overlay(
                HStack(spacing: 4) {
                    Image(systemName: "location.circle.fill")
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 18, height: 18)
                        .foregroundColor(Color.TextColorPrimary)
                    
                    Text("MotoGether")
                        .font(.footnote)
                        .fontWeight(.bold)
                }
            )
            .padding()
        }
        .background(Color.MainBackgroundColor)
    }
}

struct CustomTopBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTopBar()
    }
}
