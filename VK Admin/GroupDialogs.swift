//
//  GroupDialogs.swift
//  VK Admin
//
//  Created by Orange on 28.10.16.
//  Copyright © 2016 Dmitry Bobrov. All rights reserved.
//

import Foundation

class GroupDialog {
	var id: Int
	var withUser: GroupDialogsUser
	var lastMessage: GroupDialogsMessage?

	var messagesHistory: [UInt: GroupDialogsMessage]
	var newMessages: UInt = 0 //has dialog new messages?

	init(id: Int, user: GroupDialogsUser, messagesHistory: [UInt: GroupDialogsMessage]) {
		self.id = id
		self.withUser = user
		self.messagesHistory = messagesHistory //convert [GroupDialogsMessage] to [UInt: GroupDialogsMessage] and fix input value
	}

	func NewOutputMessage(text: String) {

	}

	func SetInputMessagesReaded() {

	}

	func UpdateMessages(messages: [GroupDialogsMessage]) {

	}
}
