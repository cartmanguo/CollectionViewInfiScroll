//
//  ViewController.swift
//  CurveView
//
//  Created by randy on 16/3/1.
//  Copyright © 2016年 randy. All rights reserved.
//

import UIKit
extension CGFloat
{
    var floatValue:Float
    {
        get
        {
            return Float(self)
        }
    }
}
class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var curveView: CurveView!
    @IBOutlet weak var bgImageView: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    var models:[Model] = [Model]()
    let images = ["ds.jpg","fc.jpg","sf.jpg","fo.jpg","bb.jpg","nr.jpg"]
    let names = ["黑暗之魂3","孤岛惊魂","街头霸王5","辐射4","血源诅咒","火影忍者"]

    var lastContentOffsetX = FLT_MIN

    override func viewDidLoad() {
        super.viewDidLoad()
        bgImageView.layoutIfNeeded()
        let image = UIImage(named: images[0])
        bgImageView.image = image
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
        let blur = UIVisualEffectView(effect: blurEffect)
        blur.frame = bgImageView.bounds
        bgImageView.addSubview(blur)
        curveView.layer
        //collectionView.layoutIfNeeded()
        //self.view.bringSubviewToFront(curveView)
        for var i = 0;i<5;i++
        {
            let model = Model(title: names[i], cover: images[i])
            models.append(model)
        }
        //models.insert(models.last!, atIndex: 0)
        //models.append(models.first!)
        //collectionView.reloadData()
        let index = 10 % models.count
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        collectionView.scrollToItemAtIndexPath(NSIndexPath(forItem: 1, inSection: 0), atScrollPosition: .Left, animated: false)
        collectionView.contentOffset.x = 190
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10000
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CoverCell
        //cell.backgroundColor = UIColor.brownColor()
        let index = indexPath.row % models.count
        cell.titleLabel.text = models[index].title
        cell.cover.image = UIImage(named: models[index].cover!)
        //cell.backgroundColor = UIColor.greenColor()
        return cell
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let collectionView = scrollView as! UICollectionView
        let index = scrollView.contentOffset.x / 190 % CGFloat(models.count)
        let image = UIImage(named: images[Int(index)])
        bgImageView.image = image
//        let maxScrollOffset = CGFloat(1140)
//        print(scrollView.contentOffset,maxScrollOffset)
//
//        if scrollView.contentOffset.x == maxScrollOffset
//        {
//            let indexPath = NSIndexPath(forItem: 1, inSection: 0)
//            collectionView.scrollToItemAtIndexPath(indexPath, atScrollPosition: UICollectionViewScrollPosition.Left, animated: false)
//            collectionView.contentOffset.x = 190
//        }
//        else if scrollView.contentOffset.x == 0
//        {
//            let indexPath = NSIndexPath(forItem: models.count-2, inSection: 0)
//            collectionView.scrollToItemAtIndexPath(indexPath, atScrollPosition: .Left, animated: false)
//            
//        }
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        // We can ignore the first time scroll,
        // because it is caused by the call scrollToItemAtIndexPath: in ViewWillAppear
//        if (FLT_MIN == lastContentOffsetX) {
//            print("hahadd")
//            lastContentOffsetX = scrollView.contentOffset.x.floatValue
//            return;
//        }
//        
//        let currentOffsetX = scrollView.contentOffset.x.floatValue;
//        let currentOffsetY = scrollView.contentOffset.y.floatValue;
//        
//        let pageWidth = scrollView.frame.size.width.floatValue;
//        let offset = pageWidth * Float((models.count - 2))
//        
//        // the first page(showing the last item) is visible and user's finger is still scrolling to the right
//        if (currentOffsetX < pageWidth && lastContentOffsetX > currentOffsetX)
//        {
//            print("haha")
//            lastContentOffsetX = currentOffsetX + offset;
//            scrollView.contentOffset = CGPointMake(CGFloat(lastContentOffsetX), CGFloat(currentOffsetY));
//        }
//            // the last page (showing the first item) is visible and the user's finger is still scrolling to the left
//        else if (currentOffsetX > offset && lastContentOffsetX < currentOffsetX)
//        {
//            print("heihei")
//            lastContentOffsetX = currentOffsetX - offset;
//            scrollView.contentOffset = CGPointMake(CGFloat(lastContentOffsetX), CGFloat(currentOffsetY))
//        } else {
//            lastContentOffsetX = currentOffsetX;
//        }
//        print(currentOffsetX,lastContentOffsetX)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

}

