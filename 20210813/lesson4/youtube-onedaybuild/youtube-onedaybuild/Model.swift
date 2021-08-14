//
//  Model.swift
//  youtube-onedaybuild
//
//  Created by Yuru Chen on 2021/8/13.
//

import Foundation

//call API

class Model{
    
    func getVideos(){
        let url = URL(string: Constants.API_URL)
        guard url != nil else {
            return
        }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) {
            data, response, error in
            
            //1. Check errors
            if error != nil || data == nil{
                return 
            }
            
            //error handling
            do{
                //2. Parsing the data into video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                //if find date in JSON, it'll be .iso8601 format
                let response = try decoder.decode(Response.self, from: data!)
                
                dump(response) //break point
            }
            catch{
                
            }

        }
        
        //start the task
        dataTask.resume()
        
    }
    

}
