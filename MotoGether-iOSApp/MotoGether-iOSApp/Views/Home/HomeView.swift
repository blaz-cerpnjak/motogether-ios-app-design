//
//  HomeView.swift
//  MotoGether-iOSApp
//
//  Created by Blaž Čerpnjak on 06/03/2023.
//

import SwiftUI
import SlidingTabView

struct HomeView: View {
    @State private var tabIndex = 0
    
    var body: some View {
        VStack {
            HStack {
                Text("Skupinske vožnje")
                    .font(.title2)
                    .bold()
                
                Spacer()
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
            
            SlidingTabView(selection: $tabIndex,
                           tabs: ["Kratke razdalje", "Dolge razdalje"],
                           font: Font.subheadline.weight(.semibold),
                           animation: .easeInOut,
                           activeAccentColor: Color.PrimaryColor,
                           inactiveAccentColor: Color.TextColorSecondary,
                           selectionBarColor: Color.PrimaryColor
            ).padding(.bottom, -16)
            
            if tabIndex == 0 {
                PathsListView()
            } else {
                PathsListView()
            }
        }
        .background(Color.MainBackgroundColor)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
