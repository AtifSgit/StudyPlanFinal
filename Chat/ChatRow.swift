//
//  ChatRow.swift
//  StudyPlan
//
//  Created by ATIF on 11/03/2022.
//

import SwiftUI

struct ChatRow: View {
    
    let chat: Chat
    
    var body: some View {
        HStack{
            Image(chat.person.imgString)
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            
            ZStack{
                VStack(alignment: .leading, spacing: 5){
                HStack{
                    Text(chat.person.name)
                        .bold()
                    
                    Spacer()
                    
                    Text(chat.messages.last?.date.descriptiveString() ?? "").font(.subheadline)
                        .foregroundColor(Color.gray)
                    
                    
                }
                    
                    
                    HStack{
                        Text(chat.messages.last?.text ?? "")
                            .foregroundColor(.gray)
                            .lineLimit(2)
                            .frame(height:50, alignment: .top)
                            .frame(maxWidth: .infinity, alignment:  .leading)
                            .padding(.trailing, 40)
                    }
            }
        }
    }
        .frame(height: 80)
        
}
}

struct ChatRow_Previews: PreviewProvider {
    static var previews: some View {
        ChatRow(chat: Chat.sampleChat[1])
    }
}

