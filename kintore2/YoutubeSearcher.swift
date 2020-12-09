//
//  YoutubeSearcher.swift
//  YoutubeSearch1
//
//  Created by 大津 真 on 2020/01/29.
//  Copyright © 2020 大津真. All rights reserved.
//

import Foundation

class YoutubeSearcher: ObservableObject {
	@Published var results:Results?
	// 最大検索数
	let maxResults = "10"
	// APIKeyを設定
	let APIKey = "AIzaSyAR14hihGDq5-Av9LYvFiK-sJM5sfBF8sw"

	func search(keyword: String) ->() {
		// リクエスト用の文字列を生成
		guard let urlStr = "https://www.googleapis.com/youtube/v3/search?part=snippet&q=\(keyword)&type=video&maxResults=\(maxResults)&key=\(APIKey)".addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed) else {
				fatalError("URL String error")
		}
		// URLに変換する
		guard let url = URL(string:urlStr) else {
			fatalError("Could'nt convert to url: \(urlStr)")
		}
		
		// Youtube APIにリクエストを送る
		let task = URLSession.shared.dataTask(with: url) { data, response, error in
			if let jsonData = data {
				let decodedData: Results
				do {
					decodedData = try JSONDecoder().decode(Results.self, from: jsonData)
				} catch {
					fatalError("Couldn't decode JSON data.")
				}
				// メインスレッドで実行
                DispatchQueue.main.async {
					self.results = decodedData
                }
			} else {
				fatalError("Youtube API request error")
			}
		}
		task.resume()
	}	
}


