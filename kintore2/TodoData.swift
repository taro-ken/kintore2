//
//  TodoData.swift
//  kintore2
//
//  Created by 木元健太郎 on 2020/09/17.
//  Copyright © 2020 kimoto kentaro. All rights reserved.
//

import Foundation




class Item{
    var title : String
    var done : Bool = false
    
    init(title:String) {
        self.title = title
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: "todoTitle")
        aCoder.encode(done, forKey: "todoDone")
    }
    
    required init?(coder aDecoder: NSCoder) {
        title = aDecoder.decodeObject(forKey: "todoTitle") as! String
        done = aDecoder.decodeBool(forKey: "todoDone")
    }
    
    
    
    
    
}
