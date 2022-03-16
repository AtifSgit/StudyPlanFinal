//
//  NewPostViewMod.swift
//  StudyPlan
//
//  Created by ATIF on 14/03/2022.
//

import Foundation

class NewPostViewMod: ObservableObject {
    @Published var postUploaded = false
    let service = PostService()
    
    func uploadPost(withCaption caption: String, withPic picURL: String){
        service.uploadPost(caption: caption, picURL: picURL) { success in
            if success {
                self.postUploaded = true
            } else {
                print("done")
            }
        }
        
    }
    
    
    
    
}

