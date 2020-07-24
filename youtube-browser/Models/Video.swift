//
//  Video.swift
//  youtube-browser
//
//  Created by Artur Plath on 24/07/2020.
//  Copyright © 2020 Artur Plath. All rights reserved.
//

import Foundation

struct Video: Decodable {

    // Video parameters from I need .json file
    var videoId:String
    var title:String
    var description:String
    var thumbnail:String
    var publishedAt = Date()
    var channelTitle:String
    
    enum CodingKeys: String, CodingKey {
        case videoId
        case snippet
        case publishedAt
        case title
        case description
        case thumbnails
        case high
        case url
        case chanelTitle
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.videoId = try container.decode(String.self, forKey: .videoId)
        
        
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        self.publishedAt = try snippetContainer.decode(Date.self, forKey: .publishedAt)
        
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        
        self.channelTitle = try snippetContainer.decode(String.self, forKey: .chanelTitle)
        
        let thumbnailsContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        
        let highThumbnailContainer = try thumbnailsContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        self.thumbnail = try highThumbnailContainer.decode(String.self, forKey: .url)
    }
}
