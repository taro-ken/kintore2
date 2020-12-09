//
//  YoutubeView.swift
//  YoutubeSearch1
//
//  Created by 大津 真 on 2020/01/11.
//  Copyright © 2020 大津真. All rights reserved.
//

import SwiftUI
import WebKit

struct YoutubeView: UIViewRepresentable {
	let url: String
	
    
    
	func makeUIView(context: Context) -> WKWebView {
        
        
		return WKWebView()
        
	}
	
	func updateUIView(_ uiView: WKWebView, context: Context) {
		uiView.load(URLRequest(url: URL(string: url)!))
	}
    
    
    
}

struct YoutubeView_Previews: PreviewProvider {
	static var previews: some View {
		YoutubeView(url: "https://www.rutles.net")
	}
    
}



    
