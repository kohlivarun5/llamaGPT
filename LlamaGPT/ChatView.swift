//
//  ChatView.swift
//  LlamaGPT
//
//  Created by Varun Kohli on 9/12/23.
//

import SwiftUI

struct ChatView: View {
  
  @State var newPrompt: String = ""
  
  let items: [Item]
  
  var body: some View {
   // NavigationView {
      VStack {
        List {
          ForEach(items, id: \.self.timestamp) { item in
            MessageView(item: item)
              .listRowSeparator(.hidden)
          }
        }
        
        .listStyle(.plain)
        HStack {
          TextField(
            "",
            text: $newPrompt
          )
          .textFieldStyle(RoundedBorderTextFieldStyle())
          .onSubmit {
            print(newPrompt)
          }
          .border(.secondary)
          
          
 //           .frame(minHeight: CGFloat(30))
          //Button(action: sendMessage) {
          //  Text("Send")
          //}
        }.frame(minHeight: CGFloat(50)).padding()
   //   }
       
    }
  }
  
}

struct ChatView_Previews: PreviewProvider {
  static var previews: some View {
    ChatView(items:TestItems.sampleItems)
  }
}
