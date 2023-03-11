//
//  PathRowView.swift
//  MotoGether-iOSApp
//
//  Created by Blaž Čerpnjak on 10/03/2023.
//

import SwiftUI

struct PathRowView: View {
    var path: Path
    
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                Text("Marko Voluhar")
                    .font(.headline)
                
                Text("Novinec")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.black)
                        .rotationEffect(Angle(degrees: 90))
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            PathRouteView(start: "SLO, Kamnik", dest: "SLO, Novo Mesto")
            
            FooterInfoView(
                date: "11.3.2023",
                duration: "70 min (93 km)",
                numberOfParticipants: 10
            )
        }
    }
}

struct PathRowView_Previews: PreviewProvider {
    static var previews: some View {
        PathRowView(path: Path(
            startDate: Date(), endDate: Date(),
            isConfirmed: true, isPrivate: false,
            isLimited: false, numberOfParticipantsLimited: 10,
            details: "Very nice path", isInterested: false)
        )
    }
}

struct PathRouteView: View {
    var start: String
    var dest: String
    
    var body: some View {
        HStack(spacing: 15) {
            Text(start)
                .foregroundColor(.blue)
                .font(.subheadline)
                .fontWeight(.medium)
                .minimumScaleFactor(0.5)
                .lineLimit(2)
            
            Spacer()
            
            Image(systemName: "arrow.right")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .foregroundColor(.gray)
            
            Spacer()
            
            Text(dest)
                .foregroundColor(.blue)
                .font(.subheadline)
                .fontWeight(.medium)
                .minimumScaleFactor(0.5)
                .lineLimit(2)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct FooterInfoView: View {
    var date: String
    var duration: String
    var numberOfParticipants = 0
    
    var body: some View {
        HStack(spacing: 15) {
            Text(date)
                .foregroundColor(.blue)
                .font(.subheadline)
                .fontWeight(.medium)
                .minimumScaleFactor(0.5)
                .lineLimit(2)
            
            Spacer()
            
            Text(duration)
                .foregroundColor(.blue)
                .font(.subheadline)
                .fontWeight(.medium)
                .minimumScaleFactor(0.5)
                .lineLimit(2)
            
            Spacer()
            
            HStack {
                Image(systemName: "person.fill.checkmark")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 15, height: 15)
                    .foregroundColor(.blue)
                
                Text(String(numberOfParticipants))
                    .foregroundColor(.blue)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .minimumScaleFactor(0.5)
                    .lineLimit(2)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
