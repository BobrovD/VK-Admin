//
//  GroupManagementPosition.swift
//  VK Admin
//
//  Created by Orange on 02.11.16.
//  Copyright © 2016 Dmitry Bobrov. All rights reserved.
//

import Foundation

let GroupManagementPositionNames: [String: String] = [
	"administrator": "Администратор",
	"editor": "Редактор",
	"moderator": "Модератор"
]

class GroupManagementPosition {
	var position: String
	var name: String

	init(position: String){
		self.position = position
		self.name = (GroupManagementPositionNames[position])!//fix??
	}
}
