//
//  Alarm.swift
//  Alarmadillo
//
//  Created by Amanda Reinhard on 6/11/18.
//  Copyright © 2018 Amanda Reinhard. All rights reserved.
//

import UIKit

class Alarm: NSObject {
    var id: String
    var name: String
    var caption: String
    var time: Date
    var image: String
    
    init(name: String, caption: String, time: Date, image: String) {
        self.id = UUID().uuidString
        self.name = name
        self.caption = caption
        self.time = time
        self.image = image
    }
}
