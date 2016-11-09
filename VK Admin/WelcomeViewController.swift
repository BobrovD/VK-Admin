//
//  ViewController.swift
//  VK Admin
//
//  Created by Orange on 07.11.16.
//  Copyright © 2016 Dmitry Bobrov. All rights reserved.
//

import UIKit
import SwiftyVK


class WelcomeViewController: UIViewController {

	@IBOutlet weak var CheckAuthIndicator: UIActivityIndicatorView!
	@IBOutlet weak var AuthButton: UIButton!

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		VK.logOut()
		print(VK.state)
		switch VK.state{
			case .configured, .unknown:
				CheckAuthIndicator.isHidden = true
				AuthButton.isHidden = false
			case .authorized:
				print("authorized")
				//go to grouplist screen
			break;
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func AuthButtonPressed(_ sender: UIButton) {
		VK.logIn()
	}
}

