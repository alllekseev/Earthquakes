//
//  CacheEntryObject.swift
//  Earthquakes-iOS
//
//  Created by Олег Алексеев on 16.01.2024.
//  Copyright © 2024 Apple. All rights reserved.
//

import Foundation

final class CacheEntryObject {

    let entry: CacheEntry
    
    init(entry: CacheEntry) {
        self.entry = entry
    }
}
enum CacheEntry {
    case inProgress(Task<QuakeLocation, Error>)
    case ready(QuakeLocation)
}
