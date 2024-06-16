//
//  Item.swift
//  JourneyMap
//
//  Created by aicccux on 6/16/24.
//

import Foundation
import SwiftData

@Model
final class MarkerItem {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
