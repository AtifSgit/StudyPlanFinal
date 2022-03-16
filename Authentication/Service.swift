//
//  Service.swift
//  StudyPlan
//
//  Created by ATIF on 13/03/2022.
//

import Firebase

struct Service {
    
    func fetchUser(withUid uid: String, completion: @escaping(User) -> Void) {
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let snapshot = snapshot else { return }
                
                guard let user = try? snapshot.data(as: User.self) else { return }
                
                
               completion(user)
            
    }
}
    
    
}
