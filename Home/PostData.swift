//
//  PostData.swift
//  StudyPlan
//
//  Created by ATIF on 14/03/2022.
//

import FirebaseFirestoreSwift
import Firebase
import Foundation

struct Post: Identifiable, Decodable {
    @DocumentID var id: String?
    let caption: String
    let timestamp: Date
    let picURL: String
    let uid: String
    var likes: Int
    
    var user: User?
}
