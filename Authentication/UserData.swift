//
//  UserData.swift
//  StudyPlan
//
//  Created by ATIF on 13/03/2022.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable {
    @DocumentID var id:String?
    let username: String
    let fullname: String
    let profilePicURL: String
    let email: String
}
