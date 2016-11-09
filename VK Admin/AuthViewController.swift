//
//  AuthViewController.swift
//  VK Admin
//
//  Created by Orange on 08.11.16.
//  Copyright © 2016 Dmitry Bobrov. All rights reserved.
//

import UIKit
import SwiftyVK

class AuthViewController: UIViewController {
	@IBOutlet weak var AuthWebView: UIWebView!

	override func viewDidLoad() {
		super.viewDidLoad()

		loadAuthUrl()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	func loadAuthUrl(){
		let url = URL(string: "https://oauth.vk.com/authorize?client_id=5698005&display=page&redirect_uri=https://oauth.vk.com/blank.html&scope=messages,offline,groups,stats&response_type=token&v=5.52")!
        AuthWebView.loadRequest(URLRequest(url: url))
	}
	
}
