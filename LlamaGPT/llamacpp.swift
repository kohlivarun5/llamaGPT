  //
  //  llamacpp.swift
  //  LlamaGPT
  //
  //  Created by Varun Kohli on 9/16/23.
  //

import Foundation
import llama


/*
 
 @Sendable func run() async {
 while true {
 print("Enter prompt: ")
 guard let prompt = readLine()?.trimmingCharacters(in: .whitespacesAndNewlines), !prompt.isEmpty else {
 break
 }
 
 let tokenStream = LlamaRunner(modelURL: url).run(
 with: prompt,
 stateChangeHandler: { state in
 switch state {
 case .notStarted:
 break
 case .initializing:
 print("Initializing model... ", terminator: "")
 case .generatingOutput:
 print("Done.")
 print("")
 print("Generating output...")
 print("\"", terminator: "")
 case .completed:
 print("\"")
 print("")
 case .failed:
 // Handle this in the catch {}
 break
 }
 })
 
 do {
 for try await token in tokenStream {
 print(token, terminator: "")
 }
 } catch let error {
 print("")
 print("Failed to generate output:", error.localizedDescription)
 }
 }
 }
 
 */

class ModelRunner {
  private var modelRunner : LlamaRunner?
  
  private func modelUrl() -> URL? {
    return Bundle.main.url(forResource: "llama-2-7b-chat", withExtension: "gguf", subdirectory: "models")
      // TODO : Make this from bundle
  }
  
  func run(prompt:String) -> AsyncThrowingStream<String, Error> {
    
    switch modelRunner {
    case .none:
      guard let url = self.modelUrl() else { exit(1) }
      self.modelRunner = LlamaRunner(modelURL: url)
      return self.run(prompt: prompt)
    case .some(let runner):
      return runner.run(with:prompt,stateChangeHandler: { state in
        switch state {
        case .notStarted:
          print("notStarted")
          break
        case .initializing:
          print("Initializing model... ", terminator: "")
        case .generatingOutput:
          print("Done.")
          print("")
          print("Generating output...")
          print("\"", terminator: "")
        case .completed:
          print("\"")
          print("")
        case .failed:
          print("failed")
            // Handle this in the catch {}
          break
        }
      })
    }
    
  }
  
}
