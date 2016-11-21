//
//  App.swift
//  VK Admin
//
//  Created by Orange on 29.10.16.
//  Copyright © 2016 Dmitry Bobrov. All rights reserved.
//

import Foundation
import KeychainSwift

class Application{
	public var authorized: Bool
	public var user: ApplicationUser

	public var userToken: String = ""
	/*{
		get {
			if let uT = keychain.get("user_token") {
				return uT
			} else {
				return ""
			}
		}
		set(uT){
			print("set: \(uT)")
			if (keychain.set(uT, forKey: "user_token")) {
				print("setted success")
			} else {
				print(keychain.lastResultCode)
			}
			print("setted: \(keychain.get("user_token"))")
		}
	}*/
	public var groupToken: String = ""
	/*{
		get {
			if let gT = keychain.get("group_token") {
				return gT
			} else {
				return ""
			}
		}
		set(gT){
			keychain.set(gT, forKey: "group_token")
		}
	}
	*/

	init(){
		self.authorized = false
		self.user = ApplicationUser()
	}
}

let App = Application()

var keychain: KeychainSwift = KeychainSwift()
