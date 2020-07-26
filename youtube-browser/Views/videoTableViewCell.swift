//
//  videoTableViewCell.swift
//  youtube-browser
//
//  Created by Artur Plath on 25/07/2020.
//  Copyright © 2020 Artur Plath. All rights reserved.
//

import UIKit

class videoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    var video:Video?
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setCell(_ v:Video) {
        
        self.video = v
        
        guard self.video != nil else {
            return
        }
        
        self.titleLabel.text = self.video?.title
        
    }

}
