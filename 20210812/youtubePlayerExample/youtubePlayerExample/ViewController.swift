//
//  ViewController.swift
//  youtubePlayerExample
//
//  Created by Yuru Chen on 2021/8/12.
//

import UIKit
import youtube_ios_player_helper

class ViewController: UIViewController, YTPlayerViewDelegate {
    
    @IBOutlet var playerview: YTPlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        playerview.delegate = self
        //playerview.load(withPlaylistId: "PLqe3OIlEQZdJVFSluE46HtRaBBtRi0Yd-", playerVars: ["playsinline": 1])
        playerview.load(withVideoId: "QtNgOs2AJEc",
                        playerVars: ["playsinline": 1,"rel": 0])
                        //播放時不自動放大//相關影片來自同一頻道
    }
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        playerview.playVideo() //點下去自動播放
    }

}

