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
	var name: String? {
		didSet {
			Group.LoadGroupList()
		}
	}
	var avatar: String?

	init(){}

	func LoadUser(){
		VK.SendUserRequest(method: "users.get", parametrs: [:], callback: {response in
			self.name = "123"
		})
	}
}
