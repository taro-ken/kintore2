//
//  Event.swift
//  kintore2
//
//  Created by 木元健太郎 on 2020/08/10.
//  Copyright © 2020 kimoto kentaro. All rights reserved.
//

import Foundation
import RealmSwift

class EventModel: Object {
    @objc dynamic var title = ""
    @objc dynamic var memo = ""
    @objc dynamic var date = "" //yyyy.MM.dd
    @objc dynamic var start_time = "" //00:00
    @objc dynamic var end_time = "" //00:00
}


