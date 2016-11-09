//
//  GroupDialogsUser.swift
//  VK Admin
//
//  Created by Orange on 28.10.16.
//  Copyright © 2016 Dmitry Bobrov. All rights reserved.
//

import Foundation

class GroupDialogsUser{
	var user: User
	var online: Int //0 - nope, 1 - desctop, 2 - mobile

	init(id: Int, name: String, avatar: String, online: Int){
		self.online = online	//почему нельзя после super.init поставить self.online?!
		self.user = User.init(id: id, name: name, avatar: avatar)
	}
}
