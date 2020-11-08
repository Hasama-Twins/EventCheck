//
//  SavedEventsTableViewCell.swift
//  EventCheck
//
//  Created by Evelyn Hasama on 11/7/20.
//

import UIKit

class SavedEventsTableViewCell: UITableViewCell {

    @IBOutlet weak var eventName: UILabel!
    
    @IBOutlet weak var eventDateTime: UILabel!
    
    @IBOutlet weak var eventDescription: UILabel!
    
    @IBOutlet weak var eventPhoto: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
