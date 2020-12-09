//
//  SearchViewController.swift
//  kintore2
//
//  Created by 木元健太郎 on 2020/08/09.
//  Copyright © 2020 kimoto kentaro. All rights reserved.
//

import UIKit
import PureLayout

class SearchViewController: UIViewController, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
    
    
    // MARK: - Properties
    private var videos: [Video] = [Video]()
    
    // MARK: - View Elements
    let searchBar: UISearchBar
    let tableView: UITableView
    
    // MARK: - Initializers
    init() {
        self.searchBar = UISearchBar.newAutoLayout()
        self.tableView = UITableView.newAutoLayout()
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Controller Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        searchBar.becomeFirstResponder()
        
        configureNavigationBar()
        addSubviews()
        addConstraints()
        configureSubviews()
    }
    
    // MARK: - View Setup
    private func configureNavigationBar() {
        self.title = "Youtube video search"
    }
    
    private func addSubviews() {
        view.addSubview(searchBar)
        view.addSubview(tableView)
    }
    
    private func configureSubviews() {
        searchBar.delegate = self

        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    private func addConstraints() {
       
        searchBar.autoPinEdge(toSuperviewEdge: .left)
        searchBar.autoPinEdge(toSuperviewEdge: .right)
        
        tableView.autoPinEdge(.top, to: .bottom, of: searchBar)
        tableView.autoPinEdge(toSuperviewEdge: .left)
        tableView.autoPinEdge(toSuperviewEdge: .right)
        tableView.autoPinEdge(toSuperviewEdge: .bottom)
    }
    
}


// MARK: - UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate
{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard searchBar.text != nil else { return }
        

       
       
    
    }


// MARK: - UITableViewDataSource

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        }
        
}

// MARK: - UITableViewDataSource
extension SearchViewController: UITableViewDelegate {
    private func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let videoViewController = VideoViewController(video: videos[indexPath.row])
        navigationController?.pushViewController(videoViewController, animated: true)
    }

    private func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 64
    }
}









