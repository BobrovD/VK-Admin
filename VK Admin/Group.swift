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
var SelectedGroup: Group? = nil

class Group {
	var data: GroupData?
	var id: Int
	var name: String
	var token: String?
	var position: GroupManagementPosition
	var dialogs: [GroupDialog]?
	var newMessages: Int = 0

	init(id: Int, name: String, admin_level: Int) {
		self.id = id
		self.name = name
		self.position = GroupManagementPosition(position: admin_level)
	}

	class func LoadGroupList () {
		GroupList = [:]

		VK.instance.SendRequest(method: "groups.get", parametrs: ["filter":"admin,editor,moder","extended":"1","fields":"admin_level,name,photo_50","access_token":Application.instance.user.token!], callback: {response in
				let groups = response?["response"]["items"]
				var gString: [String] = []
				for (_ , g) in groups! {
					GroupList[g["id"].intValue] = Group(id: g["id"].intValue, name: g["name"].stringValue, admin_level: g["admin_level"].intValue)
					gString.append(g["id"].stringValue)
				}
				Authorizator.instance.setGroupList(groups: gString)
				Authorizator.instance.AuthWebView?.loadRequest(Authorizator.instance.getGroupsTokenRequest())
			}
		)
	}

	class func LoadUnansweredMessages () {
		var counter = GroupList.count
		for (_, group) in GroupList {
			VK.instance.SendRequest(method: "messages.getDialogs", parametrs: ["count":"11", "unanswered":"1", "access_token":group.token!], callback: { response in
					let res = response?["response"]
					if res != nil {
						for (index, value) in res! {
							if index == "count" {
								group.newMessages = value.intValue
							}
						}
					} else {
						group.dialogs = nil
					}
					counter -= 1
					if counter == 0 {
						Authorizator.instance.AuthSuccess()
					}
				}
			)
		}
	}

	class func SetGroupTokenFromString(groupString: String, token: String) {
		let groupId = Helper.instance.getGroupIdFromString(string: groupString)
		if let _ = GroupList[groupId] {
			GroupList[groupId]?.token = token
		}
	}
}
