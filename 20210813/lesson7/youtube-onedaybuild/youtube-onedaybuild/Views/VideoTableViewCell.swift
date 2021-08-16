//
//  VideoTableViewCell.swift
//  youtube-onedaybuild
//
//  Created by Yuru Chen on 2021/8/16.

//  Customize each table cell

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var video:Video?
    
    func setCell(_ v:Video){
        
        self.video = v
        
        //Ensure that we have video
        guard video != nil else {
            return
        }
        
        //Set the title
        titleLabel.text = video!.title
        
        //Set the date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        dateLabel.text = df.string(from: video!.published)
        
        //Set the thumbnail
        guard self.video!.thumbnail != "" else {
            return
        }
        
        //Check cache before downloading data
        if let cachedData = CacheManager.getVideoCache(self.video!.thumbnail) {
            
            //Set the thumbnail imageview
            self.thumbnailImageView.image = UIImage(data: cachedData)
            return
            
        }
        
        //Download thumbnail
        let url = URL(string: self.video!.thumbnail)
        
        //Get the shared URL session object
        let session = URLSession.shared
        
        //Create a data task
        let dataTask = session.dataTask(with: url!) { data, response, error in
            
            if error == nil && data != nil{
                
                //Save the data in the cache
                CacheManager.setVideoCache(url!.absoluteString, data)
                
                //檢查縮圖是否正確
                if url!.absoluteString != self.video?.thumbnail{
                    
                    //縮圖錯誤
                    return
                    
                }
                
                //Create the image object
                let image = UIImage(data: data!)
                
                //Set the image view
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                }
                
            }
            
        }
        
        //Start data task
        dataTask.resume()
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
