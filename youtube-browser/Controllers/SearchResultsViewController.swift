//
//  SearchResultsViewController.swift
//  youtube-browser
//
//  Created by Artur Plath on 24/07/2020.
//  Copyright © 2020 Artur Plath. All rights reserved.
//

import UIKit

class SearchResultsViewController: UIViewController, ModelDelegate, UITableViewDelegate, UITableViewDataSource {


    

    var model = Model()
    
    var videos = [Video]()
    
    
    
    @IBOutlet weak var videosTableView: UITableView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        model.delegate = self
        videosTableView.delegate = self
        videosTableView.dataSource = self
        
        model.getVideos()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    

    

    
    
    
    func videosFetched(_ videos: [Video]) {
        self.videos = videos
        videosTableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = videosTableView.dequeueReusableCell(withIdentifier: Constants.videosTableViewIdentifier, for: indexPath) as! VideoTableViewCell
        
        let video = videos[indexPath.row]
        
        cell.setCell(video)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}
