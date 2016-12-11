//
//  Group.swift
//  VK Admin
//
//  Created by Orange on 27.10.16.
//  Copyright © 2016 Dmitry Bobrov. All rights reserved.
//

import Foundation
import UIKit


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

	class func loadGroupListFromVK (callback: (()->())?) {
		GroupList = [:]

		VK.instance.sendRequest(method: "groups.get", parametrs: ["filter":"admin,editor,moder","extended":"1","fields":"admin_level,name,photo_50","access_token":Application.instance.user.token!], callback: {response in
				let groups = response?["response"]["items"]
				var gString: [String] = []
				for (_ , g) in groups! {
					GroupList[g["id"].intValue] = Group(id: g["id"].intValue, name: g["name"].stringValue, admin_level: g["admin_level"].intValue)
					gString.append(g["id"].stringValue)
				}
				Group.saveGroupListToDB()
				Authorizator.instance.setGroupList(groups: gString)
				callback?()
			}
		)
	}

	class func loadGroupListFromDB ( callback: (()->())? ) {
		GroupList = [:]
	}

	class func saveGroupListToDB () {

	}

	class func loadUnansweredMessages( callback: (()->())? ) {
		var counter = GroupList.count	//не догнал как сделать с вычитанием из списка элементов
		if GroupList.count > 0 {
			for (_, group) in GroupList {
				VK.instance.sendRequest(method: "messages.getDialogs", parametrs: ["count":"11", "unanswered":"1", "access_token":group.token!], callback: { response in
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
						if counter <= 0 {
							Application.instance.authorized = true
							callback?()
						}
					}
				)
			}
		} else {
			Application.instance.authorized = true
			callback?()
		}
	}

	class func setGroupTokenFromString(groupString: String, token: String) {
		let groupId = Helper.instance.getGroupIdFromString(string: groupString)
		if let _ = GroupList[groupId] {
			GroupList[groupId]?.token = token
		}
	}

	class func showGroupList() {
		print("total: \(GroupList.count) groups")
		for (_, group) in GroupList {
			print("Group: \(group.name); new messages: \(group.newMessages)")
		}
	}

	class func getGroupArray() -> [Int: Group] {
		var groups: [Int: Group] = [:]
		var counter = 0
		for (_, group) in GroupList {
			groups[counter] = group
			counter += 1
		}
		return groups
	}
}
