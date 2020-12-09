//
//  SearchTableViewCell.swift
//  kintore2
//
//  Created by 木元健太郎 on 2020/08/09.
//  Copyright © 2020 kimoto kentaro. All rights reserved.
//


import UIKit

class SearchTableViewCell: UITableViewCell {
    // MARK: - View Elements
    let itemImageView: UIImageView
    let titleLabel: UILabel
    let dateLabel: UILabel
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        itemImageView = UIImageView.newAutoLayout()
        titleLabel = UILabel.newAutoLayout()
        dateLabel = UILabel.newAutoLayout()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        configureSubviews()
        addConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Setup
    private func addSubviews() {
        contentView.addSubview(itemImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLabel)
    }
    
    private func configureSubviews() {}
    
    private func addConstraints() {
        itemImageView.autoPinEdge(toSuperviewEdge: .top, withInset: 2.0)
        itemImageView.autoPinEdge(toSuperviewEdge: .left, withInset: 2.0)
        itemImageView.autoSetDimensions(to: CGSize(width: 320/3, height: 180/3))

        titleLabel.autoPinEdge(.leading, to: .trailing, of: itemImageView, withOffset: 3.0)
        titleLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 5.0)
        titleLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 2.0)

        dateLabel.autoPinEdge(.leading, to: .trailing, of: itemImageView, withOffset: 3.0)
        dateLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: 5.0)
        dateLabel.autoPinEdge(toSuperviewEdge: .right, withInset: 2.0)
}
    
    func configureView(video: Video) {
        itemImageView.image = video.image

        titleLabel.numberOfLines = 2
        titleLabel.font = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
        titleLabel.text = video.title
        
        
        dateLabel.textColor = UIColor.lightGray
        dateLabel.font = UIFont.systemFont(ofSize: UIFont.smallSystemFontSize)
    }
}
