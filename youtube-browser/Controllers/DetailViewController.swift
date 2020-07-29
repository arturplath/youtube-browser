//
//  detailViewController.swift
//  youtube-browser
//
//  Created by Artur Plath on 27/07/2020.
//  Copyright © 2020 Artur Plath. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var channelLabel: UILabel!
    
    
    @IBOutlet weak var videoWKWebView: WKWebView!
    
    
    @IBOutlet weak var dateLabel: UILabel!
    
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    
    var selectedVideo:Video?
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        // Setting details and actual video to properties
        self.titleLabel.text = self.selectedVideo?.title
        
        self.channelLabel.text = "Published by: " + self.selectedVideo!.channelTitle
        
        
        let embedUrl = URL(string: Constants.youtubeEmbedUrl + selectedVideo!.videoId)
        
        let request = URLRequest(url: embedUrl!)
        
        self.videoWKWebView.load(request)
        
        let df = DateFormatter()
        df.dateFormat = Constants.dateFormat
        
        self.dateLabel.text = "Published on: " + df.string(from: self.selectedVideo!.publishedAt)
        
        self.descriptionTextView.text = self.selectedVideo?.description
        

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Video"
    }
    



}
