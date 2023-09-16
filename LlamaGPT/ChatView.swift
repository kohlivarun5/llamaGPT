  //
  //  ChatView.swift
  //  LlamaGPT
  //
  //  Created by Varun Kohli on 9/12/23.
  //

import SwiftUI
import SwiftData

struct ChatView: View {
  
  @Environment(\.modelContext) private var modelContext
  @Query private var items: [Item]
  
  @State var newPrompt: String = ""
  
  @State var response: String = ""
  
  private var llama = ModelRunner()
  
  private func onSubmit() {
    let content = self.newPrompt
    withAnimation {
      let newItem = Item(content: content, isPrompt: true)
      modelContext.insert(newItem)
    }
    
    Task {
      do {
        let stream = llama.run(prompt: content)
        for try await token in stream {
          self.response = self.response + token
        }
      } catch let error {
        print("")
        print("Failed to generate output:", error.localizedDescription)
      }
    }
  }
  
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
      
      ContentMessageView(contentMessage: response, isPrompt:true)
      
      HStack {
        TextField(
          "",
          text: $newPrompt
        )
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .onSubmit(onSubmit)
        .border(.secondary)
        .frame(minHeight: CGFloat(30))
        Button(action: onSubmit) {
          Text("Send")
        }
      }.frame(minHeight: CGFloat(50)).padding()
    }
    
  }
}

struct ChatView_Previews: PreviewProvider {
  static var previews: some View {
    ChatView()
  }
}
