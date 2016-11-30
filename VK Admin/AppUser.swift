//
//  AppUser.swift
//  VK Admin
//
//  Created by Orange on 31.10.16.
//  Copyright © 2016 Dmitry Bobrov. All rights reserved.
//

import Foundation
import SwiftyJSON

class ApplicationUser {
	var id: Int?
	var name: String?
	var avatar: String?
	var token: String? {
		didSet {
			if self.name != nil && self.avatar != nil && self.id != nil {
				self.SaveUserToDB()
			}
		}
	}

	public func ShowUser() {
		print("current user: \(self.name)")
		print("id: \(self.id)")
		print("user token: \(self.token)")
	}

	public func LoadUser() {
		VK.instance.SendRequest(method: "users.get", parametrs: ["access_token":self.token!], callback: {response in
			let users = response?["response"]
			for (_, u) in users! {
				self.id = u["id"].intValue
				self.name = u["first_name"].stringValue + " " + u["last_name"].stringValue
				self.avatar = u["avatar"].stringValue
				Group.LoadGroupList()
				break
			}
		})
	}

	class func LoadUserFromDB() -> ApplicationUser? {
		if let user = SQLite.instance.getLastUser() {
			return user
		}
		return nil
	}

	public func SaveUserToDB(){
		SQLite.instance.addOrUpdateUser(user: self)
	}
}
