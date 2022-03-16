//
//  ProfileView.swift
//  StudyPlan
//
//  Created by ATIF on 09/03/2022.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    @State private var selectionFilter: PostProfileViewMod = .posts
    @EnvironmentObject var authViewModel: AuthenViewMod
    @ObservedObject var viewModel = HomeViewMod()
    
    var body: some View {
        if let user = authViewModel.currentUser {
            
            VStack{
                ZStack(alignment: .bottomLeading){
                    Color(.cyan)
                        .ignoresSafeArea()
                    
                    VStack{
                       
                        
                        KFImage(URL(string: user.profilePicURL))
                            .resizable()
                            .scaledToFill()
                            .clipShape(Circle())
                            .frame(width: 100, height: 100)
                            .offset(x:160, y:40)
                    
                    }
                }
                .frame(height:52)
                
                VStack(alignment: .center, spacing: 4){
                   
                    Text(user.fullname)
                            .font(.title2.bold())
                                
                    Text("@\(user.username)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    
                    HStack{
                        HStack{
                            Image("book")
                                .foregroundColor(.gray)
                            Text("Computer Science BSc")
                                .foregroundColor(.gray)
                        }
                    }
                    
                    Text("Bio")
                        .font(.subheadline)
                    
                }.offset(x: 0, y: 70)
        
                VStack{
                    Button {
                        
                    } label: {
                        Text("Edit Profile")
                            .font(.subheadline).bold()
                            .frame(width: 300, height: 32)
                            .foregroundColor(.black)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,
                                                                               lineWidth: 0.75))
                    }.offset(x: 0, y: 70)
                    
                    Button {
                        authViewModel.logOut()
                    } label: {
                        Text("Sign Out")
                            .font(.subheadline).bold()
                            .frame(width: 300, height: 32)
                            .foregroundColor(.red)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.red,
                                                                               lineWidth: 0.75))
                    }.offset(x: 0, y: 70)
                }
                
                HStack {
                    ForEach(PostProfileViewMod.allCases, id: \.rawValue) { item in
                        VStack{
                            Text(item.title)
                                .font(.subheadline)
                                .fontWeight(selectionFilter == item ? .semibold : .regular)
                                .foregroundColor(selectionFilter == item ? .black : .gray)
                            
                            if selectionFilter == item {
                                Capsule()
                                    .foregroundColor(Color.teal)
                                    .frame(height: 3)
                            }  else {
                                Capsule()
                                    .foregroundColor(Color(UIColor(named: "sam")!))
                                    .frame(height: 3)
                            
                            }
                            
                        }
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                self.selectionFilter = item
                            }
                        }
                    }
                }.offset(x: 0, y: 70)
                    .padding()
                
                ScrollView{
                    LazyVStack {
                        ForEach(viewModel.posts) { post in
                            PostRow(post: post)
                                    .padding()
                        }
                    }
                }
                .offset(x: 0, y: 55)
            
                
        
                Spacer()
                
            
            }
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}



