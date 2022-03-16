//
//  PostService.swift
//  StudyPlan
//
//  Created by ATIF on 14/03/2022.
//

import Firebase


struct PostService {
    func uploadPost(caption: String, picURL:String, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let data = ["uid": uid,
                    "picURL": picURL,
                    "caption": caption,
                    "likes": 0,
                    "timestamp":Timestamp(date: Date())] as [String : Any]
        
        
        Firestore.firestore().collection("Posts").document()
            .setData(data) { error in
                if let error = error {
                    print("Uploaded : \(error.localizedDescription)")
                completion(false)
                    return
            }
                
                completion(true)
        
    }
}
    func getPosts(completion: @escaping([Post]) -> Void) {
        Firestore.firestore().collection("Posts")
            .order(by: "timestamp", descending: true)
            .getDocuments { snapshot, _ in
            guard let documents = snapshot?.documents else { return }
            let posts = documents.compactMap({ try? $0.data(as: Post.self) })
            completion(posts)
            }
            
        }
    }
    
