//
//  Item.swift
//  FastList
//
//  Created by Bastian Inuk Christensen on 09/10/2023.
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
