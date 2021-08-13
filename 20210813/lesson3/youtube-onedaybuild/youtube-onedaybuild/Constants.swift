//
//  Constants.swift
//  youtube-onedaybuild
//
//  Created by Yuru Chen on 2021/8/13.
//

import Foundation

//Store all detail configurations.

struct Constants  {
    
    static var API_KEY = "" //private!
    static var PLAYLIST_ID = "PLNQOIb22qBlAiHnrd9ZhnGvz7IerS6YNv"
    static var API_URL = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"
    
}
