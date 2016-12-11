//
//  SQLite.swift
//  VK Admin
//
//  Created by Orange on 22.11.16.
//  Copyright © 2016 Dmitry Bobrov. All rights reserved.
//

import Foundation
/*
class SQLite {
	static var instance = SQLite()

	let db: Connection

	let path: String
	let users = Table("users")
	let uid = Expression<Int64>("uid")
	let name = Expression<String>("name")
	let avatar = Expression<String>("avatar")
	let token = Expression<String>("token")
	let lastActive = Expression<Int64>("last_active")

	init(){
		self.path = NSSearchPathForDirectoriesInDomains(
			.documentDirectory, .userDomainMask, true
		).first!
		self.db = try! Connection("\(self.path)/VK-Admin.db")
		self.createUsersTable()
	}

	private func createUsersTable() {
		try! self.db.run(self.users.create(ifNotExists: true) { table in
			table.column(self.uid, primaryKey: true)
			table.column(self.name)
			table.column(self.avatar)
			table.column(self.token)
			table.column(self.lastActive)
		})
	}

	public func addOrUpdateUser(user: ApplicationUser) {
		print("addOrUpdateUser: ")
		user.showUser()
		let currentTime = NSDate().timeIntervalSince1970
		try! db.run(
			self.users.insert(
				or: .replace,
				self.uid <- Int64(user.id!),
				self.name <- user.name!,
				self.avatar <- user.avatar!,
				self.token <- user.token!,
				self.lastActive <- Int64(currentTime)
			)
		)
	}

	public func deleteUser(uid: Int) {
		print("deleteUser")
		let user = users.filter(self.uid == Int64(uid))
		try! db.run(user.delete())
	}

	private func isUserExists(uid: Int) -> Bool {
		print("isUserExists")
		let user = self.getUser(uid: uid)
		if user.id != nil {
			return true
		}
		return false
	}

	public func getUser(uid: Int) -> ApplicationUser {
		print("getUser")
		let user = ApplicationUser()
		for row in try! db.prepare("SELECT * FROM users WHERE id = \(uid)") {
			print("row: \(row)")
			user.id = row[0] as! Int?
			user.name = row[1] as! String?
			user.avatar = row[2] as! String?
			user.token = row[3] as! String?
		}
		return user
	}

	public func getLastUser() -> ApplicationUser? {
		print("getLastUser")
		let user = ApplicationUser()
		for row in try! self.db.prepare("SELECT * FROM users ORDER BY last_active DESC LIMIT 1") {
			print("row: \(row)")
			user.id = Int((row[0] as! Int64?)!)
			user.name = row[1] as! String?
			user.avatar = row[2] as! String?
			user.token = row[3] as! String?
		}
		user.showUser()
		if user.id != nil && user.token != "" && user.name != "" && user.avatar != "" {
			return user
		}
		return nil
	}

	public func clearUserList() {
		print("clearUserList")
		try! self.db.prepare(self.users.drop(ifExists: true))
		self.createUsersTable()
	}

	private func updateUserLastActive(uid: Int) -> Void {
		print("updateUserLastActive")
		let currentTime = NSDate().timeIntervalSince1970
		let user = self.users.filter(self.uid == Int64(uid))
		try! self.db.run(user.update([self.lastActive <- Int64(currentTime)]))
	}

	public func loadGroupList () -> [Group?] {
		
		return []
	}
}
*/
