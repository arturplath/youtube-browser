//
//  videoTableViewCell.swift
//  youtube-browser
//
//  Created by Artur Plath on 25/07/2020.
//  Copyright © 2020 Artur Plath. All rights reserved.
//

import UIKit

class videoTableViewCell: UITableViewCell {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    
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
        
        let df = DateFormatter()
        df.dateFormat = Constants.dateFormat
        self.dateLabel.text = df.string(from: self.video!.publishedAt)
        
        let url = URL(string: self.video!.thumbnail)
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if data == nil || error != nil {
                return
        }
            let downloadedThumbnail = UIImage(data: data!)
            
            DispatchQueue.main.async {
                self.thumbnailImageView.image = downloadedThumbnail!
            }
        }
        dataTask.resume()
    }

}
