//
//  VK.swift
//  VK Admin
//
//  Created by Orange on 08.11.16.
//  Copyright © 2016 Dmitry Bobrov. All rights reserved.
//

import Foundation
import SwiftyVK


protocol SwiftyVKDataManagerDelegate: class {
    func loadFriends()
}

class SwiftyVKManager: VKDelegate {
    let appID = "5698005"
    let scope = [VK.Scope.messages,.offline,.groups,.stats]
	
    init() {
        VK.configure(appID: appID, delegate: self)
    }
    
    static let sharedInstance: SwiftyVKManager = {
        let instance = SwiftyVKManager ()
        return instance
    }()
    
    //VKDelegate
    func vkWillAuthorize() -> [VK.Scope] {
        return scope
    }
    ///Called when SwiftyVK did authorize and receive token
    func vkDidAuthorizeWith(parameters: Dictionary<String, String>) {
        
    }
    
    ///Called when SwiftyVK did unauthorize and remove token
    func vkDidUnauthorize() {
        
    }
    ///Called when SwiftyVK did failed autorization
    func vkAutorizationFailedWith(error: VK.Error) {
        print("autorize failed with error: \n\(error)")
        
    }
    /**Called when SwiftyVK need know where a token is located
     - returns: Path to save/read token or nil if should save token to UserDefaults*/
    func vkShouldUseTokenPath() -> String? {
        return nil
    }

    /**Called when need to display a view from SwiftyVK
     - returns: UIViewController that should present autorization view controller*/
    func vkWillPresentView() -> UIViewController {
        return UIApplication.shared.delegate!.window!!.rootViewController!
    }

    func login(){
        VK.logIn()
    }
    
    func vkStatus() -> VK.States{
        return VK.state
    }
    
}
