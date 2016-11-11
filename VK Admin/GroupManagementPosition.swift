//
//  GroupManagementPosition.swift
//  VK Admin
//
//  Created by Orange on 02.11.16.
//  Copyright © 2016 Dmitry Bobrov. All rights reserved.
//

import Foundation

let GroupManagementPositionNames: [Int: String] = [
	3: "Администратор",
	2: "Редактор",
	1: "Модератор"
]

class GroupManagementPosition {
	var position: Int
	var name: String

	init(position: Int){
		self.position = position
		self.name = (GroupManagementPositionNames[position])!//?? -> !
	}
}
