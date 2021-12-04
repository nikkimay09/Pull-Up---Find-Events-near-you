//
//  EventCell.swift
//  Xplore
//
//  Created by Nikki Bandaru on 11/29/21.
//

import UIKit

class EventCell: UITableViewCell {

    @IBOutlet weak var TypeLabel: UILabel!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var posterView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
