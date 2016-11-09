//
//  GroupDialogsMessage.swift
//  VK Admin
//
//  Created by Orange on 28.10.16.
//  Copyright © 2016 Dmitry Bobrov. All rights reserved.
//

import Foundation

class GroupDialogsMessage {
	var id: Int?
	var dialogId: Int
	var from: GroupDialogsUser
	var text: String
	var timestamp: UInt
	var direction: Bool //YES - input; NO - output
	var readed: Bool //YES - readed; NO - no

	let shortMessageLength: Int = 97	//100 - "..."

	func GetShortText() -> String{	//add "/n" substring || может быть и не нужен этот метод, если для label, где отображается текст, будет overflow:hidden
		if self.text.characters.count > self.shortMessageLength {
			return self.text.substring(to: self.text.index(self.text.startIndex, offsetBy: self.shortMessageLength)) + "..."

		} else {
			return self.text
		}
	}

	init(dialog: GroupDialog, id: Int?, from: GroupDialogsUser, text: String, timestamp: UInt, readed: Bool) {
		self.id = id
		self.dialogId = dialog.id
		self.from = from
		self.text = text
		self.timestamp = timestamp
		self.readed = readed
		self.direction = (dialog.withUser.user.id == from.user.id)
	}
}
