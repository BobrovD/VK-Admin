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

class VK {

	static var instance = VK()

	private let vkApiBaseUrl = "https://api.vk.com/method/"
	private let vkApiVersion = "5.60"

	public func sendRequest(method: String, parametrs: [String: String], callback: @escaping (_ response: JSON?) -> Void){
		let urlParams = Helper.instance.getUrlStringFromDic(dic: parametrs)
		let url = self.vkApiBaseUrl + method + "?" + urlParams + "&v=" + self.vkApiVersion
		Alamofire.request(url).responseJSON { response in
			//print("request: \(response.request)")  // original URL request
			//print("response: \(response.response)") // HTTP URL response
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
