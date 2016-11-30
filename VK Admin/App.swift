//
//  App.swift
//  VK Admin
//
//  Created by Orange on 29.10.16.
//  Copyright © 2016 Dmitry Bobrov. All rights reserved.
//

import Foundation

class Application{
	static var instance = Application()
	public var authorized: Bool = false
	public var user: ApplicationUser = ApplicationUser()

}
