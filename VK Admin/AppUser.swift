//
//  AppUser.swift
//  VK Admin
//
//  Created by Orange on 31.10.16.
//  Copyright © 2016 Dmitry Bobrov. All rights reserved.
//

import Foundation

class ApplicationUser{
	var id: Int?
	var name: String?
	var avatar: String?
	var token: String?

	init(){}

	func LoadUser() -> Bool{
		return false //load user from data
	}

	func CheckToken() -> Bool{
		return true
	}

	func SetUser(id: Int, name: String, avatar: String, token: String){
		self.token = token
		self.id = id
		self.name = name
		self.avatar = avatar
	}
}
