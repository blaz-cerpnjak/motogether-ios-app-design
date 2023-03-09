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
            TopText()
            
            SlidingTabView(selection: $tabIndex,
                           tabs: ["Kratke razdalje", "Dolge razdalje"],
                           font: Font.subheadline.weight(.semibold),
                           animation: .easeInOut)
            
            Spacer()
            
            if tabIndex == 0 {
                Text("Kratke")
            } else {
                Text("Dolge")
            }
            
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct TopText: View {
    var body: some View {
        HStack {
            Text("Skupinske vožnje")
                .font(.title2)
                .bold()
            
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .font(.title)
                    .foregroundColor(.gray)
            })
        }
        .padding()
    }
}
