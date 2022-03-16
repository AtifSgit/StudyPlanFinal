//
//  PostRow.swift
//  StudyPlan
//
//  Created by ATIF on 12/03/2022.
//

import SwiftUI
import Kingfisher
import Firebase

struct PostRow: View {
    @EnvironmentObject var authViewModel: AuthenViewMod
    @State var isLiked : Bool = false
    let post: Post
    
    var body: some View {
        if let user = post.user {
        
        VStack(spacing: 7){
            HStack(spacing: 10){
                
                KFImage(URL(string: user.profilePicURL))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                Text(user.fullname)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                
                Text("@\(user.username)")
                    .foregroundColor(.black)
                    .font(.subheadline)
                
                Spacer(minLength: 0)
                
                Menu(content:  {
                    Text("Edit")
                    
                    Text("Delete")
                    
                }, label: {
                    Image(systemName: "rectangle.and.pencil.and.ellipsis")
                        .foregroundColor(Color.black)
                })
            
            }
            
            HStack{
                
            }

            HStack{
                Text(post.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                
                Spacer(minLength: 0)
                
            }
            HStack{
                Button(action: {
                    self.isLiked.toggle()
                }) {
                    Image(systemName: self.isLiked == true ? "heart.fill" : "heart")
                        .foregroundColor(.red)
                }
                
                
                
                Button {
                    
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                        .foregroundColor(.green)
                }
                
                Menu(content:  {
                    Text("Report")
                    Text("Not Interested")
                    
                }, label: {
                    Image(systemName: "hand.raised.fill")
                        .foregroundColor(.purple)
                      
                })
                
                
                Spacer(minLength: 0)
                
                
                Text("Recent")
                    .foregroundColor(.gray)
                    .font(.caption)
                
            }

        }
        .padding()
        .background(Color(UIColor(named: "john")!))
        .cornerRadius(15)
        }
     
    }
}


