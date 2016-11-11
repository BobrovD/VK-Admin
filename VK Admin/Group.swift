//
//  Group.swift
//  VK Admin
//
//  Created by Orange on 27.10.16.
//  Copyright © 2016 Dmitry Bobrov. All rights reserved.
//

import Foundation
import SwiftyVK

var GroupList: [Int: Group] = [:]

class Group {
	var data: GroupData?
	var id: Int
	var name: String
	var position: GroupManagementPosition

	init(id: Int, name: String, admin_level: Int) {//кажется, тут придётся расписывать все параметры
		self.id = id
		self.name = name
		self.position = GroupManagementPosition(position: admin_level)
	}

	class func LoadGroupData(){
		GroupList = [:]
		VK.API.Groups.get([
			VK.Arg.extended: "1",
			VK.Arg.fields: "is_admin,admin_level"
		]).send(
			onSuccess: {response in
				let groupList = response["items"].arrayValue
				for group in groupList {
					if group["is_admin"].intValue == 1 {
						GroupList[group["id"].intValue] = Group(id: group["id"].intValue, name: group["name"].stringValue, admin_level: group["admin_level"].intValue)
					}
				}
				//go to next screen
			},
			
			onError: {error in print("error")}
		)
	}
}
