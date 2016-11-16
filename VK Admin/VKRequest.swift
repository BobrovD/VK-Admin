//
//  VKRequest.swift
//  VK Admin
//
//  Created by Orange on 13.11.16.
//  Copyright © 2016 Dmitry Bobrov. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class VKRequest {

	private let vkApiBaseUrl = "https://api.vk.com/method/"
	private let vkApiVersion = "5.60"

	private func log(logme: Any){
		print(logme)
	}

	public func SendGroupRequest(method: String, parametrs: [String: String], callback: @escaping (_ response: JSON?) -> Void) -> Void {
		var newParametrs = parametrs
		newParametrs["access_token"] = App.groupToken
		self.SendRequest(method: method, parametrs: newParametrs, callback: callback)
	}

	public func SendUserRequest(method: String, parametrs: [String: String], callback: @escaping (_ response: JSON?) -> Void) -> Void {
		var newParametrs = parametrs
		newParametrs["access_token"] = App.userToken
		self.SendRequest(method: method, parametrs: newParametrs, callback: callback)
	}

	public func SendRequest(method: String, parametrs: [String: String], callback: @escaping (_ response: JSON?) -> Void){
		let urlParams = Helper.getUrlStringFromDic(dic: parametrs)
		let url = self.vkApiBaseUrl + method + "?" + urlParams + "&v=" + self.vkApiVersion
		Alamofire.request(url).responseJSON { response in
			//print(response.request)  // original URL request
			//print(response.response) // HTTP URL response
			//print(response.data)     // server data
			//print(response.result)   // result of response serialization
			switch response.result {
				case .success(let value):
					let json = JSON(value)
					callback(json)
				case .failure(let error):
					print(error)
			}
		}
	}
}

let VK = VKRequest()
