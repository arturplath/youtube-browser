//
//  Video.swift
//  youtube-browser
//
//  Created by Artur Plath on 24/07/2020.
//  Copyright © 2020 Artur Plath. All rights reserved.
//

import Foundation

struct Video: Decodable {

    // Video parameters I need .json file from
    var videoId:String
    var title:String
    var description:String
    var thumbnail:String
    var publishedAt = Date()
    var channelTitle:String
    
    enum CodingKeys: String, CodingKey {
        case items
        case id
        case videoId
        case snippet
        case publishedAt
        case title
        case description
        case thumbnails
        case high
        case url
        case channelTitle
    }
    
            // Parsing all components to .JSON
    init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let idContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .id)
        
        self.videoId = try idContainer.decode(String.self, forKey: .videoId)
        
        
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        self.publishedAt = try snippetContainer.decode(Date.self, forKey: .publishedAt)
        
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        
        self.channelTitle = try snippetContainer.decode(String.self, forKey: .channelTitle)
        
        
        let thumbnailsContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        
        let highThumbnailContainer = try thumbnailsContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        self.thumbnail = try highThumbnailContainer.decode(String.self, forKey: .url)
    }
}
