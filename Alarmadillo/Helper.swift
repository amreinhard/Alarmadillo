//
//  Helper.swift
//  Alarmadillo
//
//  Created by Amanda Reinhard on 6/12/18.
//  Copyright © 2018 Amanda Reinhard. All rights reserved.
//

import Foundation

struct Helper {
    static func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        
        return documentsDirectory
    }
}
