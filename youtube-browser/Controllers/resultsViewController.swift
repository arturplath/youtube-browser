//
//  resultsViewController.swift
//  youtube-browser
//
//  Created by Artur Plath on 25/07/2020.
//  Copyright © 2020 Artur Plath. All rights reserved.
//

import UIKit

class resultsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ModelDelegate {
    



    
    
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

        print(searchFor + "<-")
        print(videos.count)
        // Do any additional setup after loading the view.
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! videoTableViewCell
        
        let video = self.videos[indexPath.row]
        
        cell.setCell(video!)
        
        return cell
    }
    
    func videosFetched(_ videos: [Video]) {
        self.videos = videos
        
        tableView.reloadData()
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
