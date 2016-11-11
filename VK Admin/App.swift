//
//  App.swift
//  VK Admin
//
//  Created by Orange on 29.10.16.
//  Copyright © 2016 Dmitry Bobrov. All rights reserved.
//

import Foundation
import SwiftyVK


class Application{
	var authorized: Bool
	var user: ApplicationUser
	var VKManager: SwiftyVKManager

	init(){
		self.authorized = false
		self.VKManager = SwiftyVKManager()
		self.user = ApplicationUser()
	}
}

let App = Application()
