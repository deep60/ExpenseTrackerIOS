//
//  AIAssistantView.swift
//  AIExpenseTracker
//
//  Created by P Deepanshu on 10/06/24.
//

import ChatGPTUI
import SwiftUI

let apiKey = "sk-proj-Nsab64HWK4YoBVikQahqT3BlbkFJc8wUiG5to2cJndE4f958"
let _senderImage = ""
let _botImage = ""

enum ChatType: String, Identifiable, CaseIterable {
    case text = "Text"
    case voice = "Voice"
    var id: Self { self }
}

struct AIAssistantView: View {
    
    @State var chatType = ChatType.text
    @State var voiceChatVM = AIAssistantVoiceChatViewModel(apiKey: apiKey)
    @State var textChatVM = AIAssistantTextChatViewModel(apiKey: apiKey)
    
    var body: some View {
        VStack(spacing: 0) {
            Picker(selection: $chatType, label: Text("Chat Type").font(.system(size: 12, weight: .bold))) {
                ForEach(ChatType.allCases) { type in
                    Text(type.rawValue).tag(type)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)
            
            
            #if !os(iOS)
            .padding(.vertical)
            #endif
            
            Divider()
            
            ZStack {
                switch chatType {
                case .text:
                    TextChatView(customContentVM: textChatVM)
                case .voice:
                    VoiceChatView(customContentVM: voiceChatVM)
                }
            }.frame(maxWidth: 1024, alignment: .center)
        }
        
        #if !os(macOS)
        .navigationBarTitle("AI Expense Assistant", displayMode: .inline)
        #endif
    }
}

#Preview {
    AIAssistantView()
}
