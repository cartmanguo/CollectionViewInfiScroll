//
//  ZoomLayout.swift
//  CurveView
//
//  Created by randy on 16/3/1.
//  Copyright © 2016年 randy. All rights reserved.
//

import UIKit

class ZoomLayout: UICollectionViewFlowLayout {
    let size = 120
    let margin = 20
    override init()
    {
        super.init()
    }
    
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
    
    override func targetContentOffsetForProposedContentOffset(proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        var offsetAdjustment = MAXFLOAT;
        let horizontalCenter = proposedContentOffset.x + (CGRectGetWidth(self.collectionView!.bounds) / 2.0);
        let targetRect = CGRectMake(proposedContentOffset.x, 0.0, self.collectionView!.bounds.size.width, self.collectionView!.bounds.size.height);
        let array = super.layoutAttributesForElementsInRect(targetRect)
        
        //对当前屏幕中的UICollectionViewLayoutAttributes逐个与屏幕中心进行比较，找出最接近中心的一个
        for layoutAttributes in array! {
            let itemHorizontalCenter = layoutAttributes.center.x;
            if (fabs(itemHorizontalCenter - horizontalCenter) < fabs(CGFloat(offsetAdjustment))) {
                offsetAdjustment = Float(itemHorizontalCenter) - Float(horizontalCenter)
            }
        }
        return CGPointMake(proposedContentOffset.x + CGFloat(offsetAdjustment), proposedContentOffset.y);
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]?{
        let attrs = super.layoutAttributesForElementsInRect(rect)
        var visibleRect:CGRect = CGRectZero
        visibleRect.origin = collectionView!.contentOffset
        visibleRect.size = collectionView!.bounds.size
        for attr in attrs!
        {
            let distanceToBoarder = attr.center.x - collectionView!.contentOffset.x
            let center = collectionView!.frame.width/2
            let centerDistance = fabs(center - distanceToBoarder)
            let scale = 1 - centerDistance/center
            attr.transform = CGAffineTransformMakeScale(0.3*scale+1, 0.3*scale+1)
        }
        return attrs
    }
    
    override func prepareLayout() {
        super.prepareLayout()
        self.itemSize = CGSize(width: 160, height: 220)
        self.scrollDirection = .Horizontal
        self.sectionInset = UIEdgeInsets(top: collectionView!.center.y - itemSize.height/2, left: collectionView!.center.x - 80, bottom: collectionView!.center.y - itemSize.height/2, right: collectionView!.center.x - 80)
        self.minimumLineSpacing = 30
        self.minimumInteritemSpacing = 30
    }
    
    override func collectionViewContentSize() -> CGSize {
        return super.collectionViewContentSize()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }

}
