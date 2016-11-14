//
//  App.swift
//  VK Admin
//
//  Created by Orange on 29.10.16.
//  Copyright © 2016 Dmitry Bobrov. All rights reserved.
//

import Foundation


class Application{
	public var authorized: Bool
	public var user: ApplicationUser

	public var userToken: String?
	public var groupToken: String?

	init(){
		self.authorized = false
		self.user = ApplicationUser()
	}

	public func SaveToken(token: String){
		if self.userToken == nil {
			self.userToken = token
		} else {
			self.groupToken = token
		}
	}
}

let App = Application()
