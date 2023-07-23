//
//  ChatView.swift
//  Connectify
//
//  Created by Vusal Nuriyev on 20.07.23.
//

import SwiftUI


struct ChatView: View {
    @State var messages: [MessageCell] = [
        .init(text: "Hello!", isSent: .sent, isYou: true),
        .init(text: "Hi there!", isSent: .sent, isYou: false),
        .init(text: "How are you?", isSent: .sent, isYou: true),
        .init(text: "Good, u?", isSent: .sent, isYou: false),
        .init(text: "I am good as well, thanks for asking!I am good as well, thanks for askingI am good as well, thanks for askingI am good as well, thanks for askingI am good as well, thanks for askingI am good as well, thanks for askingI am good as well, thanks for askingI am good as well, thanks for askingI am good as well, thanks for askingI am good as well, thanks for askingI am good as well, thanks for askingI am good as well, thanks for askingI am good as well, thanks for askingI am good as well, thanks for askingI am good as well, thanks for askingI am good as well, thanks for askingI am good as well, thanks for askingI am good as well, thanks for asking", isSent: .sent, isYou: true),
        .init(text: "Thank you too!", isSent: .sent, isYou: false),
    ]
    
    @Binding var tabBarVisible: Bool
    var reciever: ProfileModel
    var sender: ProfileModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            GeometryReader { geometry in
                MessagesView(messages: messages)
                    .padding(.bottom, geometry.size.height / 11.5)
            }
            
            Spacer()
            VStack {
                
                ChatBarView { text in
                    let message = MessageCell(text: text, isSent: .sent, isYou: true)
                    messages.append(message)
                }
                
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                StatusView(reciever: reciever, sender: sender)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

struct StatusView: View {
    @Environment(\.presentationMode) var presentationMode
    var reciever: ProfileModel
    var sender: ProfileModel
    
    var body: some View {
        HStack {
            
            CButton(backgroundColor: .clear, width: 30, height: 30) {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image("backIcon")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            
            reciever.profileImage?
                .circularImage()
                .aspectRatio(contentMode: .fill)
                .frame(width: 30, height: 30)
            
            
            VStack(alignment: .leading) {
                Text(reciever.profileName)
                    .font(.caption)
                Text(reciever.status.rawValue)
                    .font(.caption2)
                    .foregroundColor(Color.gray)
            }
        }
    }
}

struct ChatBarView: View {
    @State var text: String = ""
    var send: ((String) -> Void)
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color(.clear))
                .frame(height: 60)
                .overlay {
                    HStack {
                        CButton(backgroundColor: Color(.systemBackground), width: 40, height: 40) {
                            
                        } label: {
                            Image(systemName: "plus")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color(.label))
                        }
                        
                        CTextField(placeholder: "Hi there...", height: 40, text: $text)
                            .background {
                                Rectangle()
                                    .fill(Color(.systemGray6))
                                    .cornerRadius(20)
                            }
                        
                        Spacer()
                        
                        CButton(backgroundColor: Color(.systemBackground), width: 40, height: 40) {
                            if text != "", !text.isEmpty {
                                send(text)
                                text = ""
                            }
                        } label: {
                            Image(systemName: "paperplane.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(Color(.label))
                        }
                        
                    }
                    .padding(.horizontal)
                }
        }
        
        
    }
}

struct MessageCellView: View {
    var text: String
    var date: Date
    var isYou: Bool
    
    var body: some View {
        HStack {
            if isYou {
                Spacer()
            }
            
            VStack(alignment: isYou ? .trailing : .leading) {
                Text(text)
                    .foregroundColor(Color(.label))
                    .interactiveDismissDisabled(true)
                
                Text(date.toString(format: "HH:mm"))
                    .foregroundColor(Color(.systemGray5))
                    .font(.caption2)
                
            }
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .fill(isYou ? Color("mainColor") : Color(.systemGray))
                    .padding(-10)
                
            }
            .padding(isYou ? .leading : .trailing, text.count > 40 ? 10 : 0)
            
            if !isYou {
                Spacer()
            }
        }
        
    }
}

import SwiftUI

struct MessagesView: View {
    var messages: [MessageCell]
    @State private var scrollProxy: ScrollViewProxy? = nil

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ScrollViewReader { proxy in
                VStack {
                    ForEach(messages) { message in
                        MessageCellView(text: message.text, date: message.date, isYou: message.isYou)
                            .padding()
                            .id(message.id)
                    }
                }
                .onAppear {
                    // Save the ScrollViewProxy to the state variable
                    scrollProxy = proxy
                    // Scroll to the bottom initially
                    scrollProxy?.scrollTo(messages.last?.id, anchor: .bottom)
                }
                .onChange(of: messages) { newMessages in
                    // When messages change, scroll to the bottom automatically
                    scrollProxy?.scrollTo(newMessages.last?.id, anchor: .bottom)
                }
                .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)) { _ in
                    // When the keyboard appears, scroll to the bottom automatically
                    scrollProxy?.scrollTo(messages.last?.id, anchor: .bottom)
                }
            }
        }
    }
}
