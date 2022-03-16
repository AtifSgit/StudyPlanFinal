//
//  ChatViewMod.swift
//  StudyPlan
//
//  Created by ATIF on 11/03/2022.
//

import Foundation

class ChatViewMod: ObservableObject {
    @Published var chats = Chat.sampleChat
    
    
    func getSortedFilteredChats(query: String) -> [Chat] {
        let sortedChats = chats.sorted {
            guard let date1 = $0.messages.last?.date else { return false }
            guard let date2 = $1.messages.last?.date else { return false }
            return date1 > date2
        }
        
        if query == "" {
            return sortedChats
    }
    
        return sortedChats.filter { $0.person.name.lowercased().contains(query.lowercased()) }
    }
    
    func sendMessage(_ text: String, in chat: Chat) -> Message? {
        if let index = chats.firstIndex(where: { $0.id == chat.id}) {
            let message = Message(text, type: .Sent)
            chats[index].messages.append(message)
            return message
        }
        return nil
    }
    
}
