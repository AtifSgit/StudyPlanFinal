//
//  ChatUI.swift
//  StudyPlan
//
//  Created by ATIF on 11/03/2022.
//

import SwiftUI

struct ChatUI: View {
    
    @EnvironmentObject var viewModel: ChatViewMod
    
    let chat: Chat
    
    @State private var text = ""
    @FocusState private var isFocused
    @State private var messageIDScroll: UUID?
    
    var body: some View {
        VStack(spacing:0) {
            GeometryReader { reader in
                ScrollView{
                    ScrollViewReader{ scrollReader in
                        getMessagesView(viewWidth: reader.size.width)
                            .padding(.horizontal)
                            .onChange(of: messageIDScroll) {_ in
                                if let messageID = messageIDScroll {
                                    scrollTo(messageID: messageID, shouldAnimate: true, scrollReader: scrollReader)
                                }
                            }
                            .onAppear {
                                if let messageID = chat.messages.last?.id {
                                    scrollTo(messageID: messageID, anchor: .bottom, shouldAnimate: false, scrollReader: scrollReader)
                                }
                            }
                        
                    }
                    
                }
            }
            .background(Color.white)
            
            toolbarView()
               
            
        }
        .padding(.top, 1)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: navBarLeadingButton, trailing: navBarTrailingButton)
    }
    
    var navBarLeadingButton: some View {
        Button(action: {}) {
            HStack{
                
                Image(chat.person.imgString)
                    .resizable()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
        
                Text(chat.person.name).bold()
                  
                
            }
            .padding()
            .foregroundColor(.black)
     
        }
    }
    
    var navBarTrailingButton: some View {
        
        HStack{
        Button(action: {}) {
        Image(systemName: "phone")
                    .foregroundColor(.black)
                  

        }
            Button(action: {}) {
            Image(systemName: "moon")
                        .foregroundColor(.black)
                      

            }
            
        }
    }
    
    func scrollTo(messageID: UUID, anchor: UnitPoint? = nil, shouldAnimate: Bool,
                  scrollReader: ScrollViewProxy) {
        DispatchQueue.main.async {
            withAnimation(shouldAnimate ? Animation.easeIn : nil) {
                scrollReader.scrollTo(messageID, anchor: anchor)
            }
        }
    }
    
    func toolbarView() -> some View {
        VStack {
            let height: CGFloat = 50
            HStack{
                TextField("Enter your messasge...", text: $text)
                    .padding(.horizontal, 10)
                    .frame(height: height)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
                    .focused($isFocused)
                
                Button(action: sendMessage) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.black)
                        .frame(width: 40, height: 40)
                        .background(
                        Circle()
                            .foregroundColor(text.isEmpty ? .gray : Color.init(red: 0, green: 255, blue: 255))
                        )
                    
                    
                    
                }
                .disabled(text.isEmpty)
                
                Button(action: sendMessage) {
                    Image(systemName: "camera.fill")
                        .foregroundColor(.black)
                        .frame(width: 40, height: 40)
                        .background(
                        Circle()
                            .foregroundColor(Color.init(red: 0, green: 255, blue: 255))
                        )
                }
               
                
            }
            .frame(height: height)
        }
        .padding(.vertical)
        .padding(.horizontal)
        .background(.thickMaterial)
    }
    
    func sendMessage() {
        if let message = viewModel.sendMessage(text, in: chat){
            text = ""
            messageIDScroll = message.id
        }
    }
    
    let columns = [GridItem(.flexible(minimum: 10))]
    
    
    func getMessagesView(viewWidth: CGFloat) -> some View {
        LazyVGrid(columns: columns, spacing: 0){
            ForEach(chat.messages) { message in
                let isReceived = message.type == .Received
                HStack {
                    ZStack{
                    Text(message.text)
                        .padding(.horizontal)
                        .padding(.vertical, 12)
                        .background(isReceived ? (Color(UIColor(named: "msg")!)) : Color.init(red: 0, green: 255, blue: 255))
                        .cornerRadius(30)
                    
            }
                .frame(width: viewWidth * 0.7, alignment: isReceived ? .leading : .trailing)
                .padding(.vertical, 7)
               
        }
            .frame(maxWidth: .infinity, alignment: isReceived ? .leading : .trailing)
            .id(message.id)
    }
    }
}
}
    


struct ChatUI_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
         
                
        ChatUI(chat: Chat.sampleChat[0])
            .environmentObject(ChatViewMod())
        }
       
        
}
}

