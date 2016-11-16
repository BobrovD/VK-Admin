//
//  Group.swift
//  VK Admin
//
//  Created by Orange on 27.10.16.
//  Copyright © 2016 Dmitry Bobrov. All rights reserved.
//

import Foundation
import SwiftyJSON



var GroupList: [Int: Group] = [:]

class Group {
	var data: GroupData?
	var id: Int
	var name: String
	var position: GroupManagementPosition

	init(id: Int, name: String, admin_level: Int) {
		self.id = id
		self.name = name
		self.position = GroupManagementPosition(position: admin_level)
	}

	class func LoadGroupList(){
		GroupList = [:]
		VK.SendUserRequest(method: "groups.get", parametrs: ["filter":"admin,editor,moder","extended":"1","fields":"admin_level,name,photo_50"], callback: {response in
				let groups = response?["items"]
				var gString: [String] = []
				for group in groups! {
					let g = JSON(group)
					GroupList[g["id"].intValue] = Group(id: g["id"].intValue, name: g["name"].stringValue, admin_level: g["admin_level"].intValue)
					gString.append(g["id"].stringValue)
				}
				Authorizator.setGroupList(groups: gString)
				Authorizator.AuthWebView?.loadRequest(Authorizator.getGroupRequest())
		})
	}
}
