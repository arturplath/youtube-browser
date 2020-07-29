//
//  resultsViewController.swift
//  youtube-browser
//
//  Created by Artur Plath on 25/07/2020.
//  Copyright © 2020 Artur Plath. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ModelDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var videos = [Video?]()
    
    
    var searchFor = ""
    
    
    var model = Model()
    
    
    override func viewWillAppear(_ animated: Bool) {

        tableView.delegate = self
        tableView.dataSource = self
        model.delegate = self
        model.videosFetched(searchFor)

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Search list"
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard tableView.indexPathForSelectedRow != nil else {
            return
        }
        
        // Setting selected video as a property given to the next view
        let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
        
        let detailVC = segue.destination as! DetailViewController
        detailVC.selectedVideo = selectedVideo
    }
    
    
    // MARK: - TableView  methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoTableViewCell
        
        let video = self.videos[indexPath.row]
        
        cell.setCell(video!)
        
        return cell
    }
    
    // MARK: - Model delegate method
    
    func videosFetched(_ videos: [Video]) {
        self.videos = videos
        
        tableView.reloadData()
    }
    

}
