//
//  MTabView.swift
//  StudyPlan
//
//  Created by ATIF on 09/03/2022.
//
  
import SwiftUI

struct MTabView: View {
    var body: some View {
       
        VStack{
            Spacer()
            TabBar()
        }.background(Color.black.opacity(0.05).edgesIgnoringSafeArea(.top))
    }
}

struct MTabView_Previews: PreviewProvider {
    static var previews: some View {
        MTabView()
    }
}

struct TabBar : View {
    
    @State var selectedindex = 0
    
    var body : some View{
        
        VStack(spacing: 0){
            ZStack{
                if self.selectedindex == 0{
                    HomeView()
                        .navigationBarHidden(true)
                }
                else if self.selectedindex == 1{
                    ExploreView()
                        .navigationBarHidden(true)
                }
                else if self.selectedindex == 2{
                    ChatListView()
                        .navigationBarHidden(true)
                }
                else{
                    ProfileView()
                        .navigationBarHidden(true)
                }
            }
        }

        HStack{
            Button(action:{
                
                self.selectedindex = 0
                
            }) {
                VStack{
                    if self.selectedindex != 0{
                        Image("home").foregroundColor(Color.black.opacity(0.2))
                    }
                    else{
                        Image("home").foregroundColor(.white)
                            .padding()
                            .background(Color.init(red: 0, green: 255, blue: 255))
                            .clipShape(Circle())
                            .offset(y: -20)
                            .padding(.bottom, -20)
                        
                        Text("Home").foregroundColor(Color.black.opacity(0.7))
                    }
               
                }
                
            }
            
            
            Spacer(minLength: 15)
            
            Button(action:{
                
                self.selectedindex = 1
                
            }) {
                VStack{
                    if self.selectedindex != 1{
                        Image("search").foregroundColor(Color.black.opacity(0.2))
                    }
                    else{
                        Image("search").foregroundColor(.white)
                            .padding()
                            .background(Color.init(red: 0, green: 255, blue: 255))
                            .clipShape(Circle())
                            .offset(y: -20)
                            .padding(.bottom, -20)
                        
                        Text("Explore").foregroundColor(Color.black.opacity(0.7))
                    }
                }
                
            }
            
            Spacer(minLength: 15)
            
            Button(action:{
                self.selectedindex = 2
                
            }) {
                VStack{
                    if self.selectedindex != 2{
                        Image("chat").foregroundColor(Color.black.opacity(0.2))
                    }
                    else{
                        Image("chat").foregroundColor(Color.white)
                            .padding()
                            .background(Color.init(red: 0, green: 255, blue: 255))
                            .clipShape(Circle())
                            .offset(y: -20)
                            .padding(.bottom, -20)
                        
                        Text("Chat").foregroundColor(Color.black.opacity(0.7))
                    }
                }
                
            }
            
            Spacer(minLength: 15)
            
            Button(action:{
                self.selectedindex = 3
                
            }) {
                VStack{
                    if self.selectedindex != 3{
                        Image("user").foregroundColor(Color.black.opacity(0.2))
                    }
                    else{
                        Image("user").foregroundColor(.white)
                            .padding()
                            .background(Color.init(red: 0, green: 255, blue: 255))
                            .clipShape(Circle())
                            .offset(y: -20)
                            .padding(.bottom, -20)
                        
                        Text("Profile").foregroundColor(Color.black.opacity(0.7))
                        
                    }
                }
                
            }
            
        }.padding(.vertical, -10)
            .padding(.horizontal, 25)
            .background(Color.white)
    }

}


