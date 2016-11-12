//
//  App.swift
//  VK Admin
//
//  Created by Orange on 29.10.16.
//  Copyright © 2016 Dmitry Bobrov. All rights reserved.
//

import Foundation


class Application{
	var authorized: Bool
	var user: ApplicationUser

	init(){
		self.authorized = false
		self.user = ApplicationUser()
	}
}

let App = Application()
