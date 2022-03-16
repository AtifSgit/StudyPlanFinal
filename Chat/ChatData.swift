//
//  ChatData.swift
//  StudyPlan
//
//  Created by ATIF on 11/03/2022.
//

import Foundation

struct Chat: Identifiable {
    var id: UUID { person.id }
    let person: Person
    var messages: [Message]
}


struct Person: Identifiable{
    let id = UUID()
    let name: String
    let imgString: String
}


struct Message: Identifiable{
    enum MessageType {

    case Sent, Received
}
    
    let id = UUID()
    let date: Date
    let text:  String
    let type: MessageType
    

init(_ text:String, type: MessageType, date:Date) {
    self.date = date
    self.type = type
    self.text = text
}

    init(_ text: String, type: MessageType){
        self.init(text, type: type, date: Date())
    }

    
}

    
    extension Chat{
        static let sampleChat = [
            Chat(person: Person(name: "Johnny", imgString: "student5"), messages:
                    [Message("", type: .Sent, date:  Date(timeIntervalSinceNow: -86400 * 3)),
                     Message("", type: .Sent, date:  Date(timeIntervalSinceNow: -86400 * 3)),
                     Message("", type: .Received, date:  Date(timeIntervalSinceNow: -86400 * 2)),
                     Message("", type: .Received, date:  Date(timeIntervalSinceNow: -86400 * 2)),
                     Message("", type: .Received, date:  Date(timeIntervalSinceNow: -86400 * 2)),
                     Message("", type: .Sent, date:  Date(timeIntervalSinceNow: -86400 * 1)),
                     Message("You alright there fella how you been", type: .Sent, date:  Date())]),
            Chat(person: Person(name: "Ronny", imgString: "student4"), messages:
                    [Message("", type: .Sent, date:  Date(timeIntervalSinceNow: -86400 * 3)),
                     Message("", type: .Sent, date:  Date(timeIntervalSinceNow: -86400 * 3)),
                     Message("", type: .Received, date:  Date(timeIntervalSinceNow: -86400 * 2)),
                     Message("", type: .Received, date:  Date(timeIntervalSinceNow: -86400 * 2)),
                     Message("", type: .Received, date:  Date(timeIntervalSinceNow: -86400 * 2)),
                     Message("Im not sure how that test went if im being honest", type: .Sent, date:  Date(timeIntervalSinceNow: -86400 * 1))]),
                    
            Chat(person: Person(name: "Jessica", imgString: "student2"), messages:
                    [Message("", type: .Sent, date:  Date(timeIntervalSinceNow: -86400 * 3)),
                     Message("", type: .Sent, date:  Date(timeIntervalSinceNow: -86400 * 3)),
                     Message("", type: .Received, date:  Date(timeIntervalSinceNow: -86400 * 2)),
                     Message("", type: .Received, date:  Date(timeIntervalSinceNow: -86400 * 2)),
                     Message("", type: .Received, date:  Date(timeIntervalSinceNow: -86400 * 2)),
                     Message("You alright there fella how you been", type: .Sent, date:  Date(timeIntervalSinceNow: -86400 * 12)),
                     Message("Yh ill catch up with you later, just need to finish off some work", type: .Sent, date:  Date(timeIntervalSinceNow: -86400 * 1))]),
            Chat(person: Person(name: "Tony", imgString: "student1"), messages:
                    [Message("You alright there fella how you been", type: .Sent, date:  Date(timeIntervalSinceNow: -86400 * 3)),
                     Message("Hows everything treating you, including all the university work", type: .Sent, date:  Date(timeIntervalSinceNow: -86400 * 3)),
                     Message("Im stressed about the exam that is coming up", type: .Received, date:  Date(timeIntervalSinceNow: -86400 * 2)),
                     Message("Ive had to do all nighters to revise", type: .Received, date:  Date(timeIntervalSinceNow: -86400 * 2)),
                     Message("Btw have you had a look at the recent tutorial, do you think that it will be helpful for the exam", type: .Received, date:  Date(timeIntervalSinceNow: -86400 * 2)),
                     Message("Do you know the topics that may come up", type: .Sent, date:  Date(timeIntervalSinceNow: -86400 * 1)),
                     Message("Yh ive had a look at the recent tutorial it seems to be alright to be fair, i think that it may be quite helpful.", type: .Sent, date:  Date(timeIntervalSinceNow: -86400 * 4))]),
            Chat(person: Person(name: "Ella", imgString: "student3"), messages:
                    [Message("", type: .Sent, date:  Date(timeIntervalSinceNow: -86400 * 3)),
                     Message("", type: .Sent, date:  Date(timeIntervalSinceNow: -86400 * 3)),
                     Message("", type: .Received, date:  Date(timeIntervalSinceNow: -86400 * 2)),
                     Message("", type: .Received, date:  Date(timeIntervalSinceNow: -86400 * 2)),
                     Message("", type: .Received, date:  Date(timeIntervalSinceNow: -86400 * 2)),
                     Message("", type: .Sent, date:  Date(timeIntervalSinceNow: -86400 * 1)),
                     Message("Ill be done with it soon ", type: .Sent, date:  Date(timeIntervalSinceNow: -86400 * 7))]),
            Chat(person: Person(name: "Leo", imgString: "student8"), messages:
                    [Message("", type: .Sent, date:  Date(timeIntervalSinceNow: -86400 * 3)),
                     Message("", type: .Sent, date:  Date(timeIntervalSinceNow: -86400 * 3)),
                     Message("", type: .Received, date:  Date(timeIntervalSinceNow: -86400 * 2)),
                     Message("", type: .Received, date:  Date(timeIntervalSinceNow: -86400 * 2)),
                     Message("", type: .Received, date:  Date(timeIntervalSinceNow: -86400 * 2)),
                     Message("", type: .Sent, date:  Date(timeIntervalSinceNow: -86400 * 3)),
                     Message("Have you had a look at the recent lecture", type: .Sent, date:  Date(timeIntervalSinceNow: -86400 * 1))]),
            Chat(person: Person(name: "Sel", imgString: "student7"), messages:
                    [Message("", type: .Sent, date:  Date(timeIntervalSinceNow: -86400 * 3)),
                     Message("", type: .Sent, date:  Date(timeIntervalSinceNow: -86400 * 3)),
                     Message("", type: .Received, date:  Date(timeIntervalSinceNow: -86400 * 2)),
                     Message("", type: .Received, date:  Date(timeIntervalSinceNow: -86400 * 2)),
                     Message("", type: .Received, date:  Date(timeIntervalSinceNow: -86400 * 2)),
                     Message("", type: .Sent, date:  Date(timeIntervalSinceNow: -86400 * 6)),
                     Message("Ill catch up with you later, need to finish some things off", type: .Sent, date:  Date(timeIntervalSinceNow: -86400 * 8))]),
            Chat(person: Person(name: "Drizz", imgString: "student11"), messages:
                    [Message("", type: .Sent, date:  Date(timeIntervalSinceNow: -86400 * 3)),
                     Message("", type: .Sent, date:  Date(timeIntervalSinceNow: -86400 * 3)),
                     Message("", type: .Received, date:  Date(timeIntervalSinceNow: -86400 * 2)),
                     Message("", type: .Received, date:  Date(timeIntervalSinceNow: -86400 * 2)),
                     Message("", type: .Received, date:  Date(timeIntervalSinceNow: -86400 * 2)),
                     Message("Yh ill be there very soon, the bus was a bit delayed", type: .Sent, date:  Date(timeIntervalSinceNow: -86400 * 16))]),
            Chat(person: Person(name: "Robbie", imgString: "student9"), messages:
                    [Message("", type: .Sent, date:  Date(timeIntervalSinceNow: -86400 * 3)),
                     Message("", type: .Sent, date:  Date(timeIntervalSinceNow: -86400 * 3)),
                     Message("", type: .Received, date:  Date(timeIntervalSinceNow: -86400 * 2)),
                     Message("", type: .Received, date:  Date(timeIntervalSinceNow: -86400 * 2)),
                     Message("", type: .Received, date:  Date(timeIntervalSinceNow: -86400 * 2)),
                     Message("Nothing Much, work has really been piling up though.", type: .Sent, date:  Date(timeIntervalSinceNow: -86400 * 20))]),
            Chat(person: Person(name: "Sam", imgString: "student10"), messages:
                    [Message("", type: .Sent, date:  Date(timeIntervalSinceNow: -86400 * 3)),
                     Message("", type: .Sent, date:  Date(timeIntervalSinceNow: -86400 * 3)),
                     Message("", type: .Received, date:  Date(timeIntervalSinceNow: -86400 * 2)),
                     Message("", type: .Received, date:  Date(timeIntervalSinceNow: -86400 * 2)),
                     Message("", type: .Received, date:  Date(timeIntervalSinceNow: -86400 * 2)),
                     Message("No problem, just been quite busy recently", type: .Sent, date:  Date(timeIntervalSinceNow: -86400 * 23))]),
                
            
        ]
                 }





