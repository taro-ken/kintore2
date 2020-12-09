//
//  ApiClient.swift
//  kintore2
//
//  Created by 木元健太郎 on 2020/08/09.
//  Copyright © 2020 kimoto kentaro. All rights reserved.
//


import UIKit

struct Constants {
    // https://developers.google.com/youtube/registering_an_application?hl=ja
    static let apiKey = "<your api key>"
    static let searchUrl = "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=50&key=\(Constants.apiKey)&q="
}

// MARK: - ApiClient
class ApiClient {
    
    class func request(url: String, completion: (NSData?, URLResponse?, NSError?) -> Void) {
        guard let url = NSURL(string: url) else {
            return
        }
        let request = NSURLRequest(url: url as URL)
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(
            configuration: configuration,
            delegate: nil,
            delegateQueue: OperationQueue.main
        )
        
        let task = session.dataTaskWithRequest(request, completionHandler: {
            (data, response, error) in
            completion(data, response, error)
            
        })
        
        task.resume()
    }
}
