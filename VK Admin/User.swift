//
//  User.swift
//  VK Admin
//
//  Created by Orange on 30.10.16.
//  Copyright © 2016 Dmitry Bobrov. All rights reserved.
//

import Foundation
import SwiftyVK

class User {
	var id: Int
	var name: String
	var avatar: String

	init(id: Int, name: String, avatar: String){
		self.id = id
		self.name = name
		self.avatar = avatar
	}
}
