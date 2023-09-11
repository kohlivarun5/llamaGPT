//
//  Item.swift
//  LlamaGPT
//
//  Created by Varun Kohli on 9/11/23.
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
