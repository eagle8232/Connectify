//
//  UserSettings.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 22.07.23.
//

import SwiftUI

enum UserDefaultKey: String {
    case isRegistered
}

@propertyWrapper
struct UserDefault<T> {
    let key: UserDefaultKey
    let defaultValue: T
    
    init(_ key: UserDefaultKey, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get {
            UserDefaults.standard.object(forKey: key.rawValue) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key.rawValue)
        }
    }
}

class UserSettings: ObservableObject {
    @UserDefault(.isRegistered, defaultValue: false)
    var isRegistered: Bool
}
