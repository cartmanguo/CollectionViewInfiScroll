//
//  Model.swift
//  CurveView
//
//  Created by randy on 16/3/1.
//  Copyright © 2016年 randy. All rights reserved.
//

import UIKit

class Model: NSObject {
    var title:String?
    var cover:String?
    init(title:String,cover:String)
    {
        self.title = title
        self.cover = cover
    }
}
