//
//  Const.swift
//  ordernote
//
//  Created by 박일호 on 07/08/2019.
//  Copyright © 2019 박일호. All rights reserved.
//

import Foundation

struct Const {
    static let PASSWORD_DIGIT_COUNT = 4
    
    static let KEY_PASSWORD = "ordernote_password"
    static let KEY_SCREENLOCK = "ordernote_screen_lock"
    static let KEY_SCREENLOCK_TIME = "ordernote_screen_lock_time"
    
    static let DEFAULT_PASSWORD = "0000"
    
    static let DEFAULT_SCREEN_LOCK_TIME = 30
}

class SettingConst {
    static func getPassword() -> String {
        
        let pw = UserDefaults.standard.string(forKey: Const.KEY_PASSWORD)
        
        return pw ?? Const.DEFAULT_PASSWORD
    }
    
    static func setPassword(pw: String) {
        UserDefaults.standard.set(pw, forKey: Const.KEY_PASSWORD)
    }
    
    static func getScreenLock() -> Bool {
        
        let isLock = UserDefaults.standard.bool(forKey: Const.KEY_SCREENLOCK)
        
        return isLock
    }
    
    static func setScreenLock(isLock: Bool) {
        UserDefaults.standard.set(isLock, forKey: Const.KEY_SCREENLOCK)
    }
    
    static func getScreenLockTime() -> Int {
        let lockTime = UserDefaults.standard.integer(forKey: Const.KEY_SCREENLOCK_TIME)
        
        return lockTime
    }
    
    static func setScreenLockTime(lockTime: Int) {
        UserDefaults.standard.set(lockTime, forKey: Const.KEY_SCREENLOCK_TIME)
    }
}
