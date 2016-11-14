//
//  Helper.swift
//  VK Admin
//
//  Created by Orange on 14.11.16.
//  Copyright © 2016 Dmitry Bobrov. All rights reserved.
//

import Foundation

class CHelper {

	public func getGetParametrsFromUrl(url: String?) -> [String: String] {
		let urlArr = url?.characters.split{$0 == "#"}.map(String.init)
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
}

let Helper = CHelper()
