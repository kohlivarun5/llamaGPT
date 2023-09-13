//
//  ContentMessageView.swift
//  LlamaGPT
//
//  Created by Varun Kohli on 9/12/23.
//

import SwiftUI

struct ContentMessageView: View {
  let contentMessage: String
  let isPrompt: Bool
  
  var body: some View {
    Text(contentMessage)
      .padding(10)
      .background(isPrompt ? Color.orange : Color.primary)
      .foregroundColor(isPrompt ? Color.primary : Color.orange)
      .cornerRadius(10)
  }
}

struct ContentMessageView_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      ContentMessageView(contentMessage: "Hi, I am your friend", isPrompt: false)
      ContentMessageView(contentMessage: "Hi, I am your friend", isPrompt: true)
    }
  }
}
