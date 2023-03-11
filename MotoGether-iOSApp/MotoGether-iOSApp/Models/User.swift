//
//  User.swift
//  MotoGether-iOSApp
//
//  Created by Blaž Čerpnjak on 10/03/2023.
//

import Foundation

struct User: Identifiable {
    var id = UUID().uuidString
    var email: String
    var name: String
    var surname: String
    var username: String
    var password: String
}
