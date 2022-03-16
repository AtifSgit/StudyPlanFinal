//
//  newPostView.swift
//  StudyPlan
//
//  Created by ATIF on 14/03/2022.
//

import SwiftUI
import Kingfisher


struct newPostView: View {
    @State private var showImageChooser = false
    @State private var selectedImage: UIImage?
    @State private var PostPic: Image?
    @EnvironmentObject var authViewModel: AuthenViewMod
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel = NewPostViewMod()
    
    @State private var caption = ""
    @State private var picURL = ""
    
    
   
    var body: some View {
        
        if let user = authViewModel.currentUser {
        VStack{
            HStack {
                Button{
                    presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Cancel")
                    .foregroundColor(.red)
            }
            

                Spacer()
         
                Button {
                    showImageChooser.toggle()
                } label: {
                    Image(systemName: "photo.fill")
                        .frame(width: 30, height: 30)
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color.init(red: 0, green: 255, blue: 255))
                        .foregroundColor(.black)
                        .clipShape(Circle())
                }
                
                Button {
                    viewModel.uploadPost(withCaption: caption, withPic: picURL)
                } label: {
                    Text("Upload")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color.init(red: 0, green: 255, blue: 255))
                        .foregroundColor(.black)
                        .clipShape(Capsule())
                }
                
                
                
        }
            .padding()
            
            ZStack{
       
            HStack(alignment: .top) {
                KFImage(URL(string: user.profilePicURL))
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 70, height: 70)
                    .padding()
                
                TextBox("Caption..", text: $caption)
                
                
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)){
                if let PostPic = PostPic {
                    PostPic
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width / 2, height: 150)
                        .cornerRadius(15)
                        .aspectRatio(contentMode: .fill)
                    
                    
                    Button {
                        print("remove pic")
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.red)
                            .padding(10)
                            .background(Color.black)
                            .clipShape(Circle())
                    }
                    
                
                }
            }
                .offset(x: -100, y: 200)
  
            }
            .sheet(isPresented: $showImageChooser, onDismiss: loadPic) {
                ImageChooser(selectedImage: $selectedImage)
            }
            }
        .navigationBarHidden(true)
            

           
    }
        .onReceive(viewModel.$postUploaded) { success in
            if success {
                presentationMode.wrappedValue.dismiss()
            }
        }
            
            
    }
    }
    
    func loadPic(){
        guard let selectedImage = selectedImage else { return }
        PostPic = Image(uiImage: selectedImage)

    }

}

struct newPostView_Previews: PreviewProvider {
    static var previews: some View {
        newPostView()
    }
}

