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
  var content: String
  var isPrompt: Bool
  var timestamp: Date = Date()
  
  
  init(content: String, isPrompt: Bool) {
    self.content = content
    self.isPrompt = isPrompt
    self.timestamp = Date()
  }
}


struct TestItems {
  static let samplePrompt = Item(content: "Hellow world in python", isPrompt: true)
  static let sampleResponse = Item(content: "Trying", isPrompt: false)
  static let sampleItems = [
    TestItems.samplePrompt,
    TestItems.sampleResponse
  ]
}
