//
//  AppUser.swift
//  VK Admin
//
//  Created by Orange on 31.10.16.
//  Copyright © 2016 Dmitry Bobrov. All rights reserved.
//

import Foundation
import SwiftyVK

class ApplicationUser{
	var id: Int?
	var name: String?
	var avatar: String?

	init(){}

	func LoadUser(){
		VK.API.Users.get([VK.Arg.fields: "photo_50"]).send(
			onSuccess: { response in
				print(response)
				self.id = response[0]["id"].intValue
				self.name = response[0]["first_name"].stringValue + response[0]["second_name"].stringValue
				self.avatar = response[0]["photo_50"].stringValue
			}
		)
	}
}
