//
//  ChatListView.swift
//  StudyPlan
//
//  Created by ATIF on 11/03/2022.
//

import SwiftUI

struct ChatListView: View {
    
    let chats = Chat.sampleChat
    
    @StateObject var viewModel = ChatViewMod()
    @State private var query = ""
    
    var body: some View {
        NavigationView{
            List{
                ForEach(viewModel.getSortedFilteredChats(query: query)) { chat in
                    
                    ZStack{
                        
                        ChatRow(chat: chat)
                        NavigationLink(destination: {
                            ChatUI(chat: chat)
                                .environmentObject(viewModel)

                        }) {
                            EmptyView()
                        }
                    
            
                    }
                
                }
            }
            .listStyle(PlainListStyle())
            .searchable(text: $query)
            .navigationTitle("Chats")
            .navigationBarItems(trailing: Button(action: {}) {
                Image(systemName: "square.and.pencil")
                
            })
            
           
        }
        Spacer()
    }
}

struct ChatListView_Previews: PreviewProvider {
    static var previews: some View {
        ChatListView()
    }
}
