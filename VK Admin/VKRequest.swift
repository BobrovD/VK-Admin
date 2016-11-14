//
//  VKRequest.swift
//  VK Admin
//
//  Created by Orange on 13.11.16.
//  Copyright © 2016 Dmitry Bobrov. All rights reserved.
//

import UIKit

var requestCount: Int = 0

class VKRequest {

	private let vkApiBaseUrl = "https://api.vk.com/method/"
	private let vkApiVersion = "5.60"

	private func log(logme: Any){
		print(logme)
	}

	public func SendRequest(method: String, parametrs: [String: String], callback: (Any) -> Any){
		let urlParams = Helper.getUrlStringFromDic(dic: parametrs)
		let url = self.vkApiBaseUrl + method
	}
}

let VK = VKRequest()
