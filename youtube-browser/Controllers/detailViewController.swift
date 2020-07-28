//
//  detailViewController.swift
//  youtube-browser
//
//  Created by Artur Plath on 27/07/2020.
//  Copyright © 2020 Artur Plath. All rights reserved.
//

import UIKit
import WebKit

class detailViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var channelLabel: UILabel!
    
    
    @IBOutlet weak var videoWKWebView: WKWebView!
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var selectedVideo:Video?
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.titleLabel.text = self.selectedVideo?.title
        
        self.channelLabel.text = "Published by:" + self.selectedVideo!.channelTitle
        
        
        let embedUrl = URL(string: Constants.youtubeEmbedUrl + selectedVideo!.videoId)
        
        let request = URLRequest(url: embedUrl!)
        
        self.videoWKWebView.load(request)
        
        let df = DateFormatter()
        df.dateFormat = Constants.dateFormat
        
        self.dateLabel.text = df.string(from: self.selectedVideo!.publishedAt)
        
        self.descriptionTextView.text = self.selectedVideo?.description
        
        
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
