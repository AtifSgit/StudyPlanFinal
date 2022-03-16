//
//  ContentView.swift
//  StudyPlan
//
//  Created by ATIF on 09/03/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    @EnvironmentObject var viewModel: AuthenViewMod
    
    
    // body
    var body: some View {
        
        if viewModel.userSession == nil{
            SignInView()
        }
        else {
            MTabView()
        }
          
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
 
