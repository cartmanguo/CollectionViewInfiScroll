//
//  CurveView.swift
//  CurveView
//
//  Created by randy on 16/3/1.
//  Copyright © 2016年 randy. All rights reserved.
//

import UIKit
@IBDesignable
class CurveView: UIView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    private func drawShape()
    {
        let bPath = UIBezierPath()
        bPath.moveToPoint(CGPointZero)
        bPath.addLineToPoint(CGPointMake(0, self.frame.size.height))
        bPath.addLineToPoint(CGPointMake(self.frame.size.width, self.frame.size.height))
        bPath.addLineToPoint(CGPointMake(self.frame.size.width, 0))
        let ctp = CGPointMake(self.frame.size.width/2, -55)
        bPath.addQuadCurveToPoint(CGPointZero, controlPoint: ctp)
        let layer = CAShapeLayer()
        layer.frame = CGRectMake(0, self.frame.size.height/2, self.frame.size.width, self.frame.size.height/2)
        layer.path = bPath.CGPath
        layer.fillColor = UIColor.whiteColor().CGColor
        layer.strokeColor = UIColor.clearColor().CGColor
        self.layer.addSublayer(layer)
    }
    
    override func layoutSubviews() {
        layoutIfNeeded()
        drawShape()
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
