//
//  ViewController.swift
//  VK Admin
//
//  Created by Orange on 07.11.16.
//  Copyright © 2016 Dmitry Bobrov. All rights reserved.
//

import UIKit


class WelcomeViewController: UIViewController, UIWebViewDelegate {

	@IBOutlet weak var ActivityIndicator: UIActivityIndicatorView!

	@IBOutlet weak var AuthButton: UIButton!

	@IBOutlet weak var AuthWebView: UIWebView!

	@IBOutlet weak var AuthFailedLabel: UILabel!
	@IBOutlet weak var AuthFailedTextLabel: UILabel!

	@IBOutlet weak var WebViewTitleLabel: UILabel!

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.

		self.AuthWebView.delegate = self

		Authorizator.instance.AuthWebView = self.AuthWebView

		if !Authorizator.instance.PrimaryAuth() {
			self.AuthButton.isHidden = false
			self.ActivityIndicator.isHidden = true
		}

	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func AuthButtonPressed(_ sender: UIButton) {
		self.ActivityIndicator.isHidden = false
		self.AuthButton.isHidden = true
		self.AuthWebView.loadRequest(Authorizator.instance.getUserTokenRequest())
	}

	func webViewDidFinishLoad(_ webView: UIWebView) {
		self.ActivityIndicator.isHidden = true
		Authorizator.instance.ProcessAuthWebView(controller: self, labels: [AuthFailedLabel, AuthFailedTextLabel, WebViewTitleLabel], buttons: [AuthButton], aIndicators: [ActivityIndicator])
	}

	func webViewDidStartLoad(_ webView: UIWebView) {
		ActivityIndicator.isHidden = false
	}

	func goToNextScreen() {
		self.performSegue(withIdentifier: "AuthSuccessSegue", sender: self)
	}

}
