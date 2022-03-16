//
//  PicUpload.swift
//  StudyPlan
//
//  Created by ATIF on 13/03/2022.
//

import Firebase
import UIKit

struct PicUpload {
    
    static func UploadPic(image: UIImage, completion: @escaping(String) -> Void) {
        guard let picData = image.jpegData(compressionQuality: 0.5) else { return }
        
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/user_pics/\(filename)")
        
        ref.putData(picData, metadata: nil) {_, error in
            if let error = error {
                print("Failed to upload: \(error.localizedDescription)")
                return
            }
            
            ref.downloadURL { picUrl, _ in
                guard let picUrl = picUrl?.absoluteString else { return }
                completion(picUrl)
                
            
     
            }
            
        }
    }
}
