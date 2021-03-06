//
//  Model.swift
//  youtube-browser
//
//  Created by Artur Plath on 24/07/2020.
//  Copyright © 2020 Artur Plath. All rights reserved.
//

import Foundation


protocol ModelDelegate {
    func videosFetched(_  videos: [Video])
}


class Model {
    
    var delegate:ModelDelegate?
    
    func videosFetched(_ q:String) {
        
        // Encode string for URL purpose (UTF-8)
        let searchFor = q.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)
        // YouTube API URL
        let apiUrl = "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=20&q=\(searchFor!)&type=video&key=\(Constants.apiKey)"
        print(apiUrl)
        let url = URL(string: apiUrl)
        
        // Session downloading, decoding and parsing data from the API
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if data == nil || error != nil {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                // YouTube API documentation says date in .json is iso8601 format
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                
                if response.items != nil {
                    DispatchQueue.main.async {
                        // Give all items to delegate
                        self.delegate?.videosFetched(response.items!)
                    }
                }
            }
            catch {
                
            }
        }
        dataTask.resume()
    }
}
