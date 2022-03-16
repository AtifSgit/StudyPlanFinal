//
//  StudyPlanApp.swift
//  StudyPlan
//
//  Created by ATIF on 09/03/2022.
//

import SwiftUI
import Firebase

@main
struct StudyPlanApp: App {
    
    
    @StateObject var viewModel = AuthenViewMod()
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
        ContentView()
            }
                .environmentObject(viewModel)
            
        }
    }
}
