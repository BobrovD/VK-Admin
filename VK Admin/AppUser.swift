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
			self.saveUserToDB()
		}
	}

	public func showUser() {
		print("current user: \(self.name)")
		print("id: \(self.id)")
		print("user token: \(self.token)")
	}

	public func loadUserFromVK( callback: (()->())? ) {
		VK.instance.sendRequest(method: "users.get", parametrs: ["access_token":self.token!], callback: { response in
			if response?["response"].count == 0 {
				print("wrong token")
				Authorizator.instance.clearAuthData()
				Authorizator.instance.callback?()
			} else {
				let users = response?["response"]
				for (_, u) in users! {
					self.id = u["id"].intValue
					self.name = u["first_name"].stringValue + " " + u["last_name"].stringValue
					self.avatar = u["avatar"].stringValue
					callback?()
					break
				}
			}
		})
	}

	class func loadUserFromDB() -> ApplicationUser? {
		if let user = SQLite.instance.getLastUser() {
			return user
		}
		return nil
	}

	public func deleteUserFromDB() {
		if self.id != nil {
			SQLite.instance.deleteUser(uid: self.id!)
		}
	}

	public func saveUserToDB(){
		print("try to save: ")
		self.showUser()
		if self.name != nil && self.avatar != nil && self.id != nil && self.token != nil
			&& self.id != 0 && self.name != "" && self.avatar != "" && self.token != "" {
			print("success try")
			SQLite.instance.addOrUpdateUser(user: self)
		} else {
			print("save failed")
		}
	}
}
