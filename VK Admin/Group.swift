//
//  Group.swift
//  VK Admin
//
//  Created by Orange on 27.10.16.
//  Copyright © 2016 Dmitry Bobrov. All rights reserved.
//

import Foundation



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

	class func LoadGroupData(){
		GroupList = [:]
		
	}
}
