//
//  Parser.swift
//  kintore2
//
//  Created by 木元健太郎 on 2020/08/09.
//  Copyright © 2020 kimoto kentaro. All rights reserved.
//


import UIKit
import SwiftyJSON

// MARK: - Parser
class Parser {
    
    // search
    class func searchListParse(data: NSData?) -> [Video] {
        var videos = [Video]()
        
        if let data = data {
            let json = JSON(data: data as Data)
            let items = json["items"]
            
            for (_,item):(String, JSON) in items {
                var video = Video()
                
                if let videoId = item["id"]["videoId"].string {
                    video.videoId = videoId
                }

                if let title = item["snippet"]["title"].string {
                    video.title = title
                }

                if let imageUrl = item["snippet"]["thumbnails"]["medium"]["url"].string {
                    video.imageUrl = imageUrl
                    video.image = UIImage.imageWithUrl(url: imageUrl)
                }

                if let publishedAt = item["snippet"]["publishedAt"].string {
                    video.publishedAt = publishedAt
                }

                videos.append(video)
            }
        }
        return videos
        
    }
}


// MARK: - Extensions
extension UIImage {
    class func imageWithUrl(url: String) -> UIImage {
        if let imageUrl = NSURL(string: url),
            let data = NSData(contentsOf: imageUrl as URL),
            let image: UIImage = UIImage(data: data as Data) {
            return image
        }
        
        return UIImage()
    }
}
