//
//  VideoTableViewCell.swift
//  youtube-browser
//
//  Created by Artur Plath on 25/07/2020.
//  Copyright © 2020 Artur Plath. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    

    
    @IBOutlet weak var publishDateLabel: UILabel!
    
    var video:Video?
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ vid:Video) {
        self .video = vid
        
        guard self.video != nil else {
            return
        }
        
        // Set the label
        self.titleLabel.text = self.video?.title
        
        // Set the date
        let df = DateFormatter()
        df.dateFormat = Constants.dateFormat
        
        self.publishDateLabel.text = df.string(from: self.video!.publishedAt)
        
        // Set the thumbnail
        
        let url = URL(fileURLWithPath: self.video!.thumbnail)
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            
            let image = UIImage(data: data!)
            
            if data != nil || error == nil {
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
            }
            else {
                return
            }
        }
        dataTask.resume()
        
        
        
    }

}
