//
//  AuthenViewMod.swift
//  StudyPlan
//
//  Created by ATIF on 12/03/2022.
//

import SwiftUI
import Firebase

class AuthenViewMod: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var didAuthUser = false
    @Published var currentUser: User?
    private var tempUserSesh: FirebaseAuth.User?
    
    private let service = Service()
    
    init() {
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
        
        
    }
    
    func signin(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Failed to sign in \(error.localizedDescription)")
                return
        }
            guard let user = result?.user else {return}
            self.userSession = user
            print("user logged in")
            
        }
    }
    func register(withEmail email: String, password: String, username: String, fullname: String){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            self.tempUserSesh = user
           
            
            let data = ["email": email, "username": username.lowercased(),
                        "fullname": fullname,
                        "uid": user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    self.didAuthUser = true 
                }
            
            
        }
    }
    
    func logOut() {
        userSession = nil
            try? Auth.auth().signOut()
    }
    
    func uploadProfilePic(_ image: UIImage) {
        guard let uid = tempUserSesh?.uid else { return }
        
        PicUpload.UploadPic(image: image) { profilePicURL in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profilePicURL": profilePicURL]) { _ in
                    self.userSession = self.tempUserSesh
                    self.fetchUser()
                }
        }
    }
    
    func fetchUser() {
        guard let uid = self.userSession?.uid else { return }
        
        service.fetchUser(withUid: uid) { user in
            self.currentUser = user
        }
    }
    
    
}

