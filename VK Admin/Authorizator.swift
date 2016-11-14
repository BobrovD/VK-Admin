//
//  Authorizator.swift
//  VK Admin
//
//  Created by Orange on 13.11.16.
//  Copyright © 2016 Dmitry Bobrov. All rights reserved.
//

import Foundation

class VKAuthorizator {

	private let url = "https://oauth.vk.com/authorize?"

	var authError = ""
	var authErrorText = ""

	let vkAppId = "5698005"

	private var parametrTokenGroups: [String: String] = [
		"client_id" : "5698005",
		"redirect_uri" : "https://oauth.vk.com/blank.html",
		"group_ids" : "",
		"scope" : "397316", //manage,messages,photos,docs
		"response_type" : "token",
		"v" : "5.60"
	]

	private var parametrTokenUser: [String: String] = [
		"client_id" : "5698005",
		"redirect_uri" : "https://oauth.vk.com/blank.html",
		"scope" : "1310720",	//groups,stats
		"response_type" : "token",
		"v" : "5.60"
	]

	private func getParametrsString(dic: [String: String]) -> String{
		return (dic.flatMap({ (key, value) -> String in
				return "\(key)=\(value)"
		}) as Array).joined(separator: "&")
	}

	private func getURLRequest(dic: [String: String]) -> URLRequest {
		let curUrl = URL(string: self.url + getParametrsString(dic: dic))
		return URLRequest(url: curUrl!)
	}

	public func getUserRequest() -> URLRequest{
		return self.getURLRequest(dic: self.parametrTokenUser)
	}

	public func getGroupRequest() -> URLRequest{
		return self.getURLRequest(dic: self.parametrTokenGroups)
	}

	public func setGroupList(groups: [String]){
		self.parametrTokenGroups["group_ids"] = groups.joined(separator: ",")
	}

	public func getRedirectUrlLength() -> Int{
		return (self.parametrTokenGroups["redirect_uri"]?.characters.count)!
	}
}

var Authorizator = VKAuthorizator()
