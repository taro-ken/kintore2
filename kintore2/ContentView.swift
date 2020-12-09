//
//  ContentView.swift
//  YoutubeSearch1
//
//  Created by 大津 真 on 2020/01/11.
//  Copyright © 2020 大津真. All rights reserved.
//

import SwiftUI


let vc = UIStoryboard(name: "ContentViewHostingController", bundle: nil).instantiateViewController(identifier: "ContentViewHostingController")



struct ContentView: View {
    @State var results:Results?
    @State private var keyword = "kintore"
    @ObservedObject var searcher = YoutubeSearcher()
    
    var body: some View {
         NavigationView{
            VStack {
                HStack {
                    
                    TextField("検索文字列", text: $keyword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    Button(action: {
                        self.searcher.search(keyword: self.keyword)
                    }) {
                        Text("検索")
                    }
                    .background(
                        Capsule()
                            .foregroundColor(.yellow)
                            .frame(width: 60, height: 30))
                        .padding(20)
                    
                }
                
                Spacer()
                if self.searcher.results != nil {
                    List {
                        ForEach(self.searcher.results!.items) {item in
                            NavigationLink(destination: YoutubeView(url: "https://www.youtube.com/watch?v=" + item.vid.videoId)) {
                                VideoRowView(title: item.snippet.title, imgURL: item.snippet.thumbnails.default.url, description: item.snippet.description)
                                
                            }
                        }
                    }	
                }
            }
            .navigationBarTitle("検索結果")
            .navigationBarHidden(true)
            
        }
    }	
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
    }
}


class ContentViewHostingController: UIHostingController<ContentView> {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder, rootView: ContentView())

    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

