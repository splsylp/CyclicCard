//
//  CyclicCardCell.swift
//  CyclicCard
//
//  Created by Tony on 17/1/11.
//  Copyright © 2017年 Tony. All rights reserved.
//

import UIKit

class CyclicCardCell: UICollectionViewCell {
    
    var index = Int() // 下标
    
    let cardImgView = UIImageView()
    let cardNameLabel = UILabel()
    
    override  init(frame: CGRect) {
        
        super.init(frame: frame)
        
        backgroundColor = GRAY_COLOR()
        layer.masksToBounds = true
        layer.cornerRadius = 5.0
        
        self.addSubview(cardImgView)
        cardImgView.frame = CGRect(x: 0, y: 0, width: self.width, height: self.width)
        
        self.addSubview(cardNameLabel)
        cardNameLabel.frame = CGRect(x: 0, y: cardImgView.bottom, width: cardImgView.width, height: self.height - cardImgView.height)
        cardNameLabel.textAlignment = NSTextAlignment.center
        cardNameLabel.textColor = Font_Color_First()
        cardNameLabel.font = AUTO_FONT(15)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
