//
//  PathsListView.swift
//  MotoGether-iOSApp
//
//  Created by Blaž Čerpnjak on 11/03/2023.
//

import SwiftUI

struct PathsListView: View {
    var body: some View {
        List(0 ..< 10) { item in
            PathRowView(path: Path(
                startDate: Date(), endDate: Date(),
                isConfirmed: true, isPrivate: false,
                isLimited: false, numberOfParticipantsLimited: 10,
                details: "Very nice path", isInterested: false)
            )
            .background(Color.MainBackgroundColor)
            .listRowInsets(EdgeInsets())
        }
        .scrollContentBackground(.hidden)
        .background(Color.MainBackgroundColor)
        .listStyle(.grouped)
    }
}

struct PathsListView_Previews: PreviewProvider {
    static var previews: some View {
        PathsListView()
    }
}
