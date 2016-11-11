//
//  GroupManagementUser.swift
//  VK Admin
//
//  Created by Orange on 29.10.16.
//  Copyright © 2016 Dmitry Bobrov. All rights reserved.
//

import Foundation

class GroupManagementUser{
	var user: User
	var position: GroupManagementPosition

	init(id: Int, name: String, avatar: String, position: Int){
		self.position = GroupManagementPosition(position: position)	//почему нельзя после super.init поставить self.position?!
		self.user = User.init(id: id, name: name, avatar: avatar)
	}

	func SetPosition(position: Int){
		if position > 0 {
			self.position = GroupManagementPosition(position: position)
		} else {
		/* eсли nil, то удаляем из администраторов
			deinit //??
		*/
		}
	}
}
