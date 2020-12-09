//
//  VideoViewController.swift
//  kintore2
//
//  Created by 木元健太郎 on 2020/08/09.
//  Copyright © 2020 kimoto kentaro. All rights reserved.
//


import UIKit
import PureLayout
import youtube_ios_player_helper

class VideoViewController: UIViewController, YTPlayerViewDelegate {
    
    // MARK: - Properties
    private var video: Video
    
    // MARK: - View Elements
    let playerView: YTPlayerView

    // MARK: - Initializers
    init(video: Video) {
        
        self.video = video
        self.playerView = YTPlayerView.newAutoLayout()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        configureNavigationBar()
        addSubviews()
        addConstraints()
        configureSubviews()
    }
    
    // MARK: - View Setup
    private func configureNavigationBar() {
        self.title = video.title
    }
    
    private func addSubviews() {
        view.addSubview(playerView)
    }
    
    private func configureSubviews() {
        playerView.delegate = self
        playerView.load(withVideoId: video.videoId, playerVars: ["playsinline":1])
    }
    
    private func addConstraints() {
        playerView.autoPinEdge(toSuperviewEdge: .top)
        //playerView.autoPinToTopLayoutGuideOfViewController(self, withInset: 0)
        playerView.autoPinEdge(toSuperviewEdge: .left)
        playerView.autoPinEdge(toSuperviewEdge: .right)
        playerView.autoSetDimension(.height, toSize: 380)
    }
}
