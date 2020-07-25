//
//  ViewController.swift
//  youtube-browser
//
//  Created by Artur Plath on 24/07/2020.
//  Copyright © 2020 Artur Plath. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ModelDelegate {
    func videosFetched(_ videos: [Video]) {
        self.videos = videos
    }
    

    var model = Model()
    var videos = [Video]()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        model.delegate = self
        
        model.getVideos()
        
        print(videos)

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {


        let searchResultsVC = segue.destination as! SearchResultsViewController
        searchResultsVC.videos = self.videos
        

    }

}
