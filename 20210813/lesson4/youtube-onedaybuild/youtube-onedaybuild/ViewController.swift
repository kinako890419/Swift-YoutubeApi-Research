//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by Yuru Chen on 2021/8/13.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideos() //break point
        
    }


}

