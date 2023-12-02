//
//  extensionUserDefaults.swift
//  DevPoliChallenge
//
//  Created by mateusdias on 26/11/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import Foundation


extension UserDefaults {
    
    enum Keys: String {
        case isFirstAccess
    }
    
    static func setFirstAccess(value: Bool){
        UserDefaults.standard.set(value, forKey: Keys.isFirstAccess.rawValue)
    }
    
    static func isFirstAccess() -> Bool {
        UserDefaults.standard.bool(forKey: Keys.isFirstAccess.rawValue)
    }
    
}
