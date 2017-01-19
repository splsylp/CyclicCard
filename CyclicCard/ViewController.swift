//
//  ViewController.swift
//  CyclicCard
//
//  Created by Tony on 17/1/11.
//  Copyright © 2017年 Tony. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    let bgview = UIView()
    var collectionView : UICollectionView!
    let showLabel = UILabel()
    let currentLabel = UILabel()
    
    let groupCount = 100 // 制造100组数据，给无限滚动提供足够多的数据，嫌少可以200，1000。。。
    var imageArr = [String]() // 图片数组
    var indexArr = [Int]() // 存储图片下标，解决制造100组图片数据占用过大内存问题
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
        
        // 设置数据源
        imageArr = ["num_1", "num_2", "num_3", "num_4", "num_5"]
        for _ in 0 ..< groupCount {
            for j in 0 ..< imageArr.count {
                indexArr.append(j)
            }
        }
        
        // 定位到 第50组(中间那组)
        collectionView.scrollToItem(at: NSIndexPath.init(item: groupCount / 2 * imageArr.count, section: 0) as IndexPath, at: UICollectionViewScrollPosition.centeredHorizontally, animated: false)
    }
    
    // MARK:- UI
    func makeUI() {
        
        automaticallyAdjustsScrollViewInsets = false
        
        bgview.frame = CGRect(x: 0, y: 64, width: SCREEN_WIDTH, height: FIT_SCREEN_HEIGHT(240))
        bgview.backgroundColor = MAIN_COLOR()
        self.view.addSubview(bgview)
        
        setupCollection()
        
        showLabel.frame = CGRect(x: 0, y: bgview.bottom + FIT_SCREEN_HEIGHT(20), width: SCREEN_WIDTH, height: FIT_SCREEN_HEIGHT(20))
        showLabel.textAlignment = NSTextAlignment.center
        showLabel.text = "滚动至第0张"
        view.addSubview(showLabel)
        
        currentLabel.frame = CGRect(x: 0, y: showLabel.bottom + FIT_SCREEN_HEIGHT(20), width: SCREEN_WIDTH, height: FIT_SCREEN_HEIGHT(20))
        currentLabel.textAlignment = NSTextAlignment.center
        currentLabel.text = "点击第 张图片"
        view.addSubview(currentLabel)
    }
    
    func setupCollection() {
        
        let padding = FIT_SCREEN_WIDTH(20)
        
        let layout = CyclicCardFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = padding
        layout.minimumInteritemSpacing = padding
        layout.sectionInset = UIEdgeInsetsMake(padding, 0, padding, 0)
        let itemW = (SCREEN_WIDTH - padding * 2) * 0.5
        layout.itemSize = CGSize(width: itemW, height: bgview.height - padding * 2)
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: bgview.height), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.collectionViewLayout = layout
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CyclicCardCell.self, forCellWithReuseIdentifier: NSStringFromClass(CyclicCardCell.self))
        bgview.addSubview(self.collectionView)
    }
    
    
    // MARK:- CollectionView
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return indexArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: NSStringFromClass(CyclicCardCell.self), for: indexPath) as! CyclicCardCell
        
        let index = indexArr[indexPath.row]
        cell.index = index
        cell.cardImgView.image = UIImage(named: imageArr[index])
        cell.cardNameLabel.text = "奔跑吧，小蜗牛~"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CyclicCardCell
        print("点击第\(cell.index + 1)张图片")
        currentLabel.text = "点击第\(cell.index + 1)张图片"
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let pointInView = view.convert(collectionView.center, to: collectionView)
        let indexPathNow = collectionView.indexPathForItem(at: pointInView)
        let index = (indexPathNow?.row ?? 0) % imageArr.count
        let curIndexStr = String(format: "滚动至第%d张", index + 1)
        print(curIndexStr)
        showLabel.text = curIndexStr
        
        // 动画停止, 重新定位到 第50组(中间那组) 模型
        collectionView.scrollToItem(at: NSIndexPath.init(item: groupCount / 2 * imageArr.count + index, section: 0) as IndexPath, at: UICollectionViewScrollPosition.centeredHorizontally, animated: false)
    }
}

