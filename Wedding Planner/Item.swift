//
//  Item.swift
//  Wedding Planner
//
//  Created by jayden morgan on 2/20/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
