//
//  Helper.swift
//  VK Admin
//
//  Created by Orange on 14.11.16.
//  Copyright © 2016 Dmitry Bobrov. All rights reserved.
//

import Foundation

class Helper {

	static var instance = Helper()

	public func getGetParametrsFromUrlByH(url: String?) -> [String: String]{
		let urlArr = url?.characters.split{$0 == "#"}.map(String.init)
		return self.getGetParametrsFromUrl(urlArr: urlArr)
	}

	public func getGetParametrsFromUrlByQ(url: String?) -> [String: String]{
		let urlArr = url?.characters.split{$0 == "?"}.map(String.init)
		return self.getGetParametrsFromUrl(urlArr: urlArr)
	}

	private func getGetParametrsFromUrl(urlArr: [String]?) -> [String: String] {
		if (urlArr?.count)! < 2 {
			return [:]
		}
		let paramPairsArr = urlArr?[1].characters.split{$0 == "&"}.map(String.init)
		var result: [String: String] = [:]
		for val in paramPairsArr! {
			let pair = val.characters.split{$0 == "="}.map(String.init)
			result[pair[0]] = pair[1]
		}
		return result
	}

	public func getUrlStringFromDic(dic: [String: String]) -> String {
		var result = ""
		var i = dic.count
		for (index, value) in dic {
			result += index + "=" + value
			if i > 1 {
				result += "&"
			}
			i -= 1
		}

		return result
	}

	public func getGroupIdFromString (string: String) -> Int {
		let stringArr = string.characters.split{$0 == "_"}.map(String.init)
		return Int(stringArr[2])!
	}
}
