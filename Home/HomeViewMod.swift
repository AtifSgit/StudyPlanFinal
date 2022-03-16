//
//  HomeViewMod.swift
//  StudyPlan
//
//  Created by ATIF on 14/03/2022.
//

import Foundation

class HomeViewMod: ObservableObject {
    @Published var posts = [Post]()
    let service = Service()
    let postService = PostService()
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        postService.getPosts { posts in
            self.posts = posts
            
            for i in 0 ..< posts.count {
                let uid = posts[i].uid
                
                self.service.fetchUser(withUid: uid) { user in
                    self.posts[i].user = user
                    
                    
                }
                
            }
            
            
            

                
                    
                }
            }
            
        }
    

