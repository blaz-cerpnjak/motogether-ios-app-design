//
//  UserDefaultsUtils.swift
//  MotoGether-iOSApp
//
//  Created by Blaž Čerpnjak on 11/03/2023.
//

import Foundation

class UserDefaultsUtils {
    
    static var shared = UserDefaultsUtils()
    
    func setDarkMode(enable: Bool) {
        let defaults = UserDefaults.standard
        defaults.set(enable, forKey: Constants.DARK_MODE)
    }
    
    func getDarkMode() -> Bool {
        let defaults = UserDefaults.standard
        return defaults.bool(forKey: Constants.DARK_MODE)
    }
    
}
