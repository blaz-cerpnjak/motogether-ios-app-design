//
//  CustomTopBar.swift
//  MotoGether-iOSApp
//
//  Created by Blaž Čerpnjak on 07/03/2023.
//

import SwiftUI

struct CustomTopBar: View {
    var body: some View {
        VStack {
            HStack {
                Button(action: {}, label: {
                    Image(systemName: "line.3.horizontal")
                        .font(.title)
                        .frame(width: 30, height: 30)
                        .padding(10)
                        //.background(.thinMaterial)
                        .foregroundColor(.gray)
                        //.cornerRadius(8)
                })
                
                Spacer()
                
                Button(action: {}, label: {
                    Image(systemName: "magnifyingglass")
                        .font(.title)
                        .frame(width: 30, height: 30)
                        .padding(10)
                        //.background(.thinMaterial)
                        .foregroundColor(.gray)
                        //.cornerRadius(8)
                })
            }
            .overlay(
                HStack(spacing: 4) {
                    Image(systemName: "location.circle.fill")
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 18, height: 18)
                        .foregroundColor(.gray)
                    
                    Text("MotoGether")
                        .font(.footnote)
                        .fontWeight(.bold)
                }
            )
            .padding()
        }
    }
}

struct CustomTopBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTopBar()
    }
}
