//
//  AppToken.swift
//  YZGithub
//
//  Created by 郑建文 on 16/7/24.
//  Copyright © 2016年 Zheng. All rights reserved.
//

import UIKit

struct AppToken {
    enum DefaultsKeys:String {
        case TokenKey = "TokenKey"
        case TokenType = "TokenType"
        case TokenScope = "TokenScope"
        case TokenExpiry = "TokenExpiry"
    }
    
    let defaults : UserDefaults
    
    static var shareInstance = AppToken()
    
    init(defaults:UserDefaults){
        self.defaults = defaults
    }
    init(){
        self.defaults = UserDefaults.standard
    }
    var access_token:String?{
        get{
            let key = defaults.string(forKey: DefaultsKeys.TokenKey.rawValue)
            return key
        }
        set(newToken){
            defaults.set(newToken, forKey: DefaultsKeys.TokenKey.rawValue)
        }
    }
    var token_type:String? {
        get {
            
            let key = defaults.string(forKey: DefaultsKeys.TokenType.rawValue)
            return key
        }
        set(newType) {
            defaults.set(newType, forKey: DefaultsKeys.TokenType.rawValue)
        }
    }
    
    var scope:String? {
        get {
            let key = defaults.string(forKey: DefaultsKeys.TokenScope.rawValue)
            return key
        }
        set(newScope) {
            defaults.set(newScope, forKey: DefaultsKeys.TokenScope.rawValue)
        }
    }
    mutating func setData(token:String,token_type:String,scope:String) {
        self.access_token = String(format: "token %@", token)
        self.token_type = token_type
        self.scope = scope

    }
    var isValid: Bool {
        if let token = access_token {
            return token.isEmpty
        }
        return false
    }

}
