//
//  HomeView.swift
//  StudyPlan
//
//  Created by ATIF on 09/03/2022.
//

import SwiftUI

struct HomeView: View {
    @State private var snewPostView = false
    @ObservedObject var viewModel = HomeViewMod()
    var body: some View {
       
        
        ZStack(alignment: .topTrailing){
            
        VStack{
        
        HStack{
            Text("StudyPlan")
                .frame(alignment: .topLeading)
                .offset(x: -150, y:0)
                .font(.headline)
        }
        
        Spacer()
        
        ScrollView{
            ForEach(viewModel.posts) { post in
                PostRow(post: post)
                        .padding()
                
            }
            
        }
    }
            
            Button {
                snewPostView.toggle()
            } label: {
                Image(systemName: "plus.square.fill")
                    .resizable()
                    .frame(width: 28, height: 28)
                    .padding()
            }
            .background(Color.init(red: 0, green: 255, blue: 255))
            .foregroundColor(.black)
            .clipShape(Circle())
            .padding()
            .offset(y: -20)
            .fullScreenCover(isPresented: $snewPostView){
                newPostView()
                    .navigationBarHidden(true)
            }
        
            
            
        }
    }
}
        
 
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
