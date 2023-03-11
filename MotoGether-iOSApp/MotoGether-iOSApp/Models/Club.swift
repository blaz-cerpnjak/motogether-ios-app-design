//
//  Club.swift
//  MotoGether-iOSApp
//
//  Created by Blaž Čerpnjak on 10/03/2023.
//

import Foundation

struct Club: Identifiable {
    var id = UUID().uuidString
    var name: String
    var isPrivate: Bool
}
