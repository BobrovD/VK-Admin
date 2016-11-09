//
//  GroupData.swift
//  VK Admin
//
//  Created by Orange on 28.10.16.
//  Copyright © 2016 Dmitry Bobrov. All rights reserved.
//

import Foundation

struct GroupData {	//all data to vk.com/dev/groups.edit
	var id: Int = 0
	var name: String = ""
	var avatar: String?
	var description: String?
	var screen_name: String?
	var access: Int = 0
	var website: String?
	var subject: GroupSubject
	var email: String?
	var phone: String?
	var rss: String?
	var event_start_date: Int?
	var event_finish_date: Int?
	var event_group_id: Int?
	var public_category: Int?
	var public_subcategory: Int?
	var public_date: String?
	var wal: Int = 0
	var topics: Int = 0
	var photos: Int = 0
	var video: Int = 0
	var audio: Int = 0
	var links: Int?
	var events: Int?
	var places: Int?
	var contacts: Int?
	var docs: Int = 0
	var wiki: Int = 0
	var messages: Int = 0
	var age_limits: Int = 0
	var market: Int = 0
	var market_comments: Int?
	var market_country: String?
	var market_city: String?
	var market_currency: Int?
	var market_contact: Int?
	var market_wiki: Int?
	var obscene_filter: Int = 0
	var obscene_stopwords: Int?
	var obscene_words: String?
}
