//
//  MessageView.swift
//  LlamaGPT
//
//  Created by Varun Kohli on 9/12/23.
//

import SwiftUI

struct MessageView : View {
  var item: Item
  var body: some View {
    HStack(alignment: .bottom, spacing: 15) {
      if !item.isPrompt {
        Spacer()
        /* Image(currentMessage.user.avatar)
          .resizable()
          .frame(width: 40, height: 40, alignment: .center)
          .cornerRadius(20)
         */
      } else {
        Spacer()
      }
      ContentMessageView(contentMessage: item.content,
                         isPrompt: item.isPrompt)
    }.padding()
  }
}

struct MessageView_Previews: PreviewProvider {
  static var previews: some View {
    MessageView(item: Item(content: "There are a lot of premium iOS templates on iosapptemplates.com", isPrompt: true))
  }
}
