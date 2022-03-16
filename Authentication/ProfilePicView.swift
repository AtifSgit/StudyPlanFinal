//
//  ProfilePicView.swift
//  StudyPlan
//
//  Created by ATIF on 12/03/2022.
//

import SwiftUI


struct ProfilePicView: View {
    @State private var showImageChooser = false
    @State private var selectedImage: UIImage?
    @State private var profilePic: Image?
    @EnvironmentObject var viewModel: AuthenViewMod
    
    
    
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                HStack { Spacer() }
                
                Text("Lets Have Fun!")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text("Select a Profile Pic.")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                
            }
            .frame(height: 260)
            .padding(.leading)
            .background(Color.init(red: 0, green: 255, blue: 255))
            .foregroundColor(.black)
            .clipShape(RoundedCorner(radius: 75, corners: [.bottomLeft]))
            
            Button {
                showImageChooser.toggle()
            } label: {
                if let profilePic = profilePic {
                    profilePic
                        .resizable()
                        .scaledToFill()
                        .frame(width: 180, height: 180)
                        .padding(.top, 44)
                        .foregroundColor(Color.teal)
                        .clipShape(Circle())
                
                }
       
                else{
                    Image(systemName: "person.crop.circle.badge.plus")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .padding(.top, 44)
                        .foregroundColor(Color.teal)
                     
                }
            }
            .sheet(isPresented: $showImageChooser, onDismiss: loadPic) {
                ImageChooser(selectedImage: $selectedImage)
            }
            
            if let selectedImage = selectedImage {
                Button {
                    viewModel.uploadProfilePic(selectedImage)
      
                } label: {
                    Text("Confirm")
                        .font(.headline)
                        .foregroundColor(.black)
                        .frame(width: 340, height: 50)
                        .background(Color.init(red: 0, green: 255, blue: 255))
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            }
            
            
            
            Spacer()
            
        }
        .ignoresSafeArea()
    }
    
    func loadPic(){
        guard let selectedImage = selectedImage else { return }
        profilePic = Image(uiImage: selectedImage)

    }
}

struct ProfilePicView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePicView()
    }
}
