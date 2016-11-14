//
//  ViewController.swift
//  VK Admin
//
//  Created by Orange on 07.11.16.
//  Copyright © 2016 Dmitry Bobrov. All rights reserved.
//

import UIKit


class WelcomeViewController: UIViewController, UIWebViewDelegate {

	@IBOutlet weak var AuthButton: UIButton!
	@IBOutlet weak var ActivityIndicator: UIActivityIndicatorView!

	@IBOutlet weak var tmpButtonToShowNextScreen: UIButton!

	@IBOutlet weak var AuthWebView: UIWebView!

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		//check auth in Application()
		AuthWebView.delegate = self
		if !App.authorized {
			ActivityIndicator.isHidden = true
			AuthButton.isHidden = false
		}

	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func AuthButtonPressed(_ sender: UIButton) {
		ActivityIndicator.isHidden = false
		AuthButton.isHidden = true
		AuthWebView.loadRequest(Authorizator.getUserRequest())
	}

	func webViewDidFinishLoad(_ webView: UIWebView) {
		ActivityIndicator.stopAnimating()
		let curUrl = self.AuthWebView.request?.url?.absoluteString
		if (curUrl?.contains("blank.html"))! {
			self.AuthWebView.isHidden = true
			let getVars = Helper.getGetParametrsFromUrl(url: curUrl)
			for (index, value) in getVars {
				switch index{
					case "access_token" :
						App.SaveToken(token: value)
						App.authorized = true
					case "user_id" :
						App.user.id = Int(value)
					case "error" :
						Authorizator.authError = value
						App.authorized = false
					case "error_description" :
						Authorizator.authErrorText = value
					default:
					break;
				}
				if App.authorized {
					self.AuthWebView.loadHTMLString("", baseURL: nil) //очищаем WebView
					self.AuthWebView.isHidden = true
					ActivityIndicator.isHidden = true
					//load user
					VK.SendRequest(method: "users.get", parametrs: [:], callback: {result in print(result)})
					//and
					//go to next screen
				} else {
					
				}
			}
		} else {
			self.AuthWebView.isHidden = true
		}
	}

	func webViewDidStartLoad(_ webView: UIWebView) {
		ActivityIndicator.isHidden = false
		ActivityIndicator.startAnimating()
	}

}
