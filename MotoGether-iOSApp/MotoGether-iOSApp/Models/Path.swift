//
//  Path.swift
//  MotoGether-iOSApp
//
//  Created by Blaž Čerpnjak on 10/03/2023.
//

import Foundation

struct Path: Identifiable {
    var id = UUID().uuidString
    var startDate: Date
    var endDate: Date
    var isConfirmed: Bool
    var isPrivate: Bool
    var isLimited: Bool
    var numberOfParticipantsLimited: Int
    var details: String
    var isInterested: Bool
}
