//
//  SubtitleCustomTableViewCell.swift
//  VK Admin
//
//  Created by Orange on 21.11.16.
//  Copyright © 2016 Dmitry Bobrov. All rights reserved.
//

import UIKit

class SubtitleCustomTableViewCell: UITableViewCell {
	@IBOutlet weak var TitleLabel: UILabel!
	@IBOutlet weak var SubtitleLabel: UILabel!
	@IBOutlet weak var MessagesLabel: UILabel!

	@IBOutlet weak var customButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
