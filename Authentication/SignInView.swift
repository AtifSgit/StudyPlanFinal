//
//  SignInView.swift
//  StudyPlan
//
//  Created by ATIF on 12/03/2022.
//

import SwiftUI

struct SignInView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthenViewMod
    
    
    var body: some View {
        VStack{
            VStack{
                HStack { Spacer() }
                
               Image("StudyPlan")
                    .frame(width: 100, height: 100)
                
                
            }
            .frame(height: 260)
            .padding(.leading)
            .background(Color.init(red: 0, green: 255, blue: 255))
            .foregroundColor(.black)
            .clipShape(RoundedCorner(radius: 75, corners: [.bottomLeft]))
            
            VStack(spacing: 40){
                
                HStack{
                    Image(systemName: "person.fill")
                TextField("Enter Email", text: $email)
                }
                Divider()
                    .padding(-25)
                    .frame(width: 310)
                    .background(Color.gray)
                
                HStack{
                    Image(systemName: "lock.fill")
                SecureField("Enter Password", text: $password)
                }
                Divider()
                    .padding(-25)
                    .background(Color.gray)
                    .frame(width: 310)
            }
            .padding(.horizontal, 32)
            .padding(.top, 44 )
            
            HStack {
                Spacer()
                
                NavigationLink {
                    Text("Reset Password View...")
                } label: {
                    Text("Forgotten Your Password?")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.teal)
                        .padding(.top, 1)
                        .padding(.trailing, 24)
                    
                }
            }
            
            Button {
                viewModel.signin(withEmail: email, password: password)
            } label: {
                Text("Sign in")
                    .font(.headline)
                    .foregroundColor(.black)
                    .frame(width: 340, height: 50)
                    .background(Color.init(red: 0, green: 255, blue: 255))
                    .clipShape(Capsule())
                    .padding()
            }
            .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            
            NavigationLink{
                RegisterView()
                    .navigationBarHidden(true)
                  
            } label: {
                HStack{
                    Text("Dont have an account?")
                        .font(.footnote)
                    
                    
                    Text("Sign Up Now!")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom, 32)
            .foregroundColor(Color.teal)
            
            
            
            Spacer()
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
