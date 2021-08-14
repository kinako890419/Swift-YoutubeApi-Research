//
//  Video.swift
//  youtube-onedaybuild
//
//  Created by Yuru Chen on 2021/8/13.
//  https://jsonlint.com/

import Foundation

//影片的東西

struct Video:Decodable {//Decode JSON
    
    var videoId = ""
    var title = "" //影片標題
    var description = "" //影片內部說明
    var thumbnail = "" //影片縮圖URL
    var published = Date() //發布日期
    
    //specify keys we want
    enum CodingKeys: String, CodingKey  {
        
        //case for each key
        
        case snippet //所有需要的都在snippet key所以特別specify出來
        case thumbnails
        case high
        case resourceId
        
        case published = "publishedAt"
        case title //JSON key name如果和var相同就不用加
        case description
        case thumbnail = "url"
        case videoId
        
    }
    
//MARK: - Initializer
    //map JSON objects into vars above
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        //look for snippet key > grab container of snippet > assign the block of snippet to snippetContainer below
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        //parse
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        
        self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
        
    }
    
}


//MARK: - JSON
//"snippet": {
//                "publishedAt": "",
//                "channelId": "",
//                "title": "",
//                "description": "",
//                "thumbnails": {
//                    "default": {
//                        "url": "",
//                        "width": 120,
//                        "height": 90
//                    },
//                    "medium": {
//                        "url": "",
//                        "width": 320,
//                        "height": 180
//                    },
//                    "high": {
//                        "url": "",
//                        "width": 480,
//                        "height": 360
//                    },
//                    "standard": {
//                        "url": "",
//                        "width": 640,
//                        "height": 480
//                    }
//                },
//                "channelTitle": "",
//                "playlistId": "",
//                "position": 0,
//                "resourceId": {
//                    "kind": "",
//                    "videoId": ""
//                },
//                "videoOwnerChannelTitle": "",
//                "videoOwnerChannelId": ""
//            }
