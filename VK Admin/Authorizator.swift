//
//  Authorizator.swift
//  VK Admin
//
//  Created by Orange on 13.11.16.
//  Copyright © 2016 Dmitry Bobrov. All rights reserved.
//

import UIKit

class VKAuthorizator {

	private let url = "https://oauth.vk.com/authorize?"

	var authError = ""
	var authErrorText = ""

	var AuthWebView: UIWebView?

	let vkAppId = "5698005"

	private var parametrTokenGroups: [String: String] = [
		"client_id" : "5698005",
		"redirect_uri" : "https://oauth.vk.com/blank.html",
		"group_ids" : "",
		"scope" : "397316", //manage,messages,photos,docs
		"response_type" : "token",
		"v" : "5.60",
		"state" : "group"
	]

	private var parametrTokenUser: [String: String] = [
		"client_id" : "5698005",
		"redirect_uri" : "https://oauth.vk.com/blank.html",
		"scope" : "1310720",	//groups,stats
		"response_type" : "token",
		"v" : "5.60",
		"state" : "user"
	]

	private func getParametrsString(dic: [String: String]) -> String {
		return (dic.flatMap({ (key, value) -> String in
				return "\(key)=\(value)"
		}) as Array).joined(separator: "&")
	}

	private func getURLRequest(dic: [String: String]) -> URLRequest {
		let curUrl = URL(string: self.url + getParametrsString(dic: dic))
		return URLRequest(url: curUrl!)
	}

	public func getUserRequest() -> URLRequest {
		return self.getURLRequest(dic: self.parametrTokenUser)
	}

	public func getGroupRequest() -> URLRequest {
		return self.getURLRequest(dic: self.parametrTokenGroups)
	}

	public func setGroupList(groups: [String]) {
		self.parametrTokenGroups["group_ids"] = groups.joined(separator: ",")
	}

	public func getRedirectUrlLength() -> Int {
		return (self.parametrTokenGroups["redirect_uri"]?.characters.count)!
	}

	private func clearAuthData() {
		self.authError = ""
		self.authErrorText = ""
		App.authorized = false
		App.groupToken = ""
		App.userToken = ""
	}

	private func LoadLocalAuthData () -> Bool {
		if App.userToken != "" && App.groupToken != "" {
			return true
		}
		return false
	}

	public func PrimaryAuth() -> Bool {
		if self.LoadLocalAuthData(){
			print("use local data")
			Group.LoadGroupList()
			return true
		}
		return false
	}

	public func ProcessAuthWebView(controller: UIViewController, labels: [UILabel], buttons: [UIButton], aIndicators: [UIActivityIndicatorView]) {

		/*
			page loaded
		*/

		let curUrl = self.AuthWebView?.request?.url?.absoluteString
		let curPath = self.AuthWebView?.request?.url?.path

		switch curPath! {
			case "/blank.html" :

				/*
					loaded answer page
				*/

				self.AuthWebView?.isHidden = true

				self.UpdateLabel(label: labels[0], text: "", isHidden: true)
				self.UpdateLabel(label: labels[1], text: "", isHidden: true)
				self.UpdateLabel(label: labels[2], text: "", isHidden: true)



				if (curUrl?.contains("state=user"))! {
					print("blank_user")
					self.ProcessingAuthUrlVars(
						type: "blank_user",
						data: Helper.getGetParametrsFromUrlByH(url: curUrl)
					)
					if App.userToken != "" {
						aIndicators[0].isHidden = false
						App.user.LoadUser()
					} else {
						buttons[0].isHidden = false
						self.clearAuthData()
						self.UpdateLabel(label: labels[0], text: Authorizator.authError, isHidden: false)
						self.UpdateLabel(label: labels[1], text: Authorizator.authErrorText, isHidden: false)
					}
				} else if (curUrl?.contains("state=group"))! {
					print("blank_group")
					self.ProcessingAuthUrlVars(
						type: "blank_group",
						data: Helper.getGetParametrsFromUrlByH(url: curUrl)
					)
					if App.groupToken != "" {
						//go to segue
						print("go to next screen")
					} else {
						buttons[0].isHidden = false
						self.clearAuthData()
						self.UpdateLabel(label: labels[0], text: Authorizator.authError, isHidden: false)
						self.UpdateLabel(label: labels[1], text: Authorizator.authErrorText, isHidden: false)
					}
				}
			case "/authorize" :

				/*
					loaded ask page
				*/

				aIndicators[0].isHidden = true

				self.AuthWebView?.isHidden = false

				self.UpdateLabel(label: labels[0], text: "", isHidden: true)
				self.UpdateLabel(label: labels[1], text: "", isHidden: true)

				if (curUrl?.contains("state=group"))! {
					print("auth_group")
					self.UpdateLabel(label: labels[2], text: "Доступ к группам", isHidden: false)
					self.ProcessingAuthUrlVars(
						type: "authorize_user",
						data: [:]
					)
				} else if (curUrl?.contains("state=user"))! {
					print("auth_user")
					self.UpdateLabel(label: labels[2], text: "Доступ к аккаунту", isHidden: false)
					self.ProcessingAuthUrlVars(
						type: "authorize_group",
						data: [:]
					)
				}
			default:
				self.AuthWebView?.isHidden = false
				print("default url: \(curUrl!)")
			break;
		}
	}

	private func UpdateLabel(label: UILabel, text: String, isHidden: Bool){
		label.text = text
		label.isHidden = isHidden
	}

	private func ProcessingAuthUrlVars(type: String, data: [String: String]?){
		switch type {
			case "blank_user" :
				for (index, value) in data! {
					switch index{
						case "access_token" :
							App.userToken = value
							Authorizator.authError = ""
							Authorizator.authErrorText = ""
						case "user_id" :
							App.user.id = Int(value)
						case "error" :
							Authorizator.authError = value
							App.authorized = false
							App.userToken = ""
						case "error_description" :
							Authorizator.authErrorText = value
						default:
						break
					}
				}
			case "blank_group" :
				for (index, value) in data! {
					switch index{
						case "access_token" :
							App.groupToken = value
							Authorizator.authError = ""
							Authorizator.authErrorText = ""
						case "error" :
							App.groupToken = ""
							Authorizator.authError = value
							App.authorized = false
						case "error_description" :
							Authorizator.authErrorText = value
						default:
						break;
					}
				}
			case "authorize_user" : break
			case "authorize_group" : break
			default:
			break
		}
	}
}

var Authorizator = VKAuthorizator()
