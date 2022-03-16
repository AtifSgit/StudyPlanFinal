//
//  ExploreView.swift
//  StudyPlan
//
//  Created by ATIF on 09/03/2022.
//

import SwiftUI

struct ExploreView: View {
    @State var searchtext = ""
    @State var isSearching = false
    @State var showResults = false
    @State var loadSearch = false
    
    var tag = ["Architecture", "Computer Science", "Medicine", "Mechanical Engineering", "Finance"]
    
    
    
    var body: some View {
        
    
            GeometryReader{ bounds in
            ScrollView{
                
                SearchBar(searchtext: $searchtext, isSearching: $isSearching, showResults: $showResults, loadSearch: $loadSearch)
                    .padding(.top,8)
                    .padding(.bottom, 2)
              
                
                ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(tag.indices)
                    {
                        Text(tag[$0])
                            .font(.subheadline)
                            .frame(height: 30)
                            .padding(.horizontal)
                            .overlay {
                                Capsule()
                                    .stroke(Color(.systemGray5), lineWidth: 1)
                            }
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 4)
                
                }
                .padding(.bottom, 2)
                
                LazyVGrid (columns: [GridItem(.adaptive(minimum: bounds.size.width / 3 - 1.2), spacing:
                                                1.2)],
            spacing: 1) {
                    ForEach(exploreData.filter({"\($0)".contains(searchtext.lowercased()) || searchtext.isEmpty})) { item in
                        
                        PicView(explore: item)
                            .frame(width: bounds.size.width / 3 - 0.6, height: bounds.size.width / 3 - 0.6)
                            .clipped()
                        
                        
                    }
                
            }

            }
           
        }
            .onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now()
                                              + 0.1) {
                    loadSearch = true
                }
            })
        
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}


struct SearchBar: View {
    @Binding var searchtext: String
    @Binding var isSearching: Bool
    @Binding var showResults: Bool
    @Binding var loadSearch: Bool
    
    var body: some View {
        HStack(spacing : 0){
            HStack{
                TextField("Search", text: $searchtext)
                    .padding(.leading, 24)
            }
            
            .frame(height: 4)
            .padding()
            .background(Color(.systemGray5))
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            .padding(.horizontal)
            .onTapGesture(perform: {
                isSearching = true
                showResults = true
            })
            .overlay{
                HStack{
                    Image(systemName: "magnifyingglass")
                    Spacer()
                    
                    Button(action: {searchtext = ""},
                           label: {
                        Image(systemName: "xmark.circle.fill")
                            .padding(.vertical)
                            .foregroundColor(.gray)
                            .opacity(isSearching ? 1 : 0)
                    })
                }
                .padding(.horizontal, 32)
                .foregroundColor(.gray)
                
            }
            .animation(loadSearch ? Animation.spring() : .none)
            
            if isSearching {
                Button(action: {
                    isSearching = false
                    searchtext = ""
                    showResults = false
                    
                    UIApplication.shared
                        .sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    
                },
                       label: {
                    Text("Cancel")
                        .padding(.trailing)
                        .padding(.leading, 0)
                    
                }
                )
                    .transition(.move(edge: .trailing))
                    .animation(Animation.spring())
            
            }
            
        }
        
        
    }
    
    
}

