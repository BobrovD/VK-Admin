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

	public var userToken: String? {
		get {
//			if let
			return ""
		}
		set{
		}
	}
	public var groupToken: String? {
		get {
			return ""
		}
		set{
		}
	}

	init(){
		self.authorized = false
		self.user = ApplicationUser()
	}
}

let App = Application()
