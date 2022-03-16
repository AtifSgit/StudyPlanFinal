//
//  ImageChooser.swift
//  StudyPlan
//
//  Created by ATIF on 12/03/2022.
//

import SwiftUI

struct ImageChooser: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var presentationMode
    
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    func makeUIViewController(context: Context) -> some UIViewController {
        let chooser = UIImagePickerController()
        chooser.delegate = context.coordinator
        return chooser
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
}

extension ImageChooser {
    class Coordinator: NSObject,UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImageChooser
        
        init(_ parent: ImageChooser) {
            self.parent = parent
            
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let image = info[.originalImage] as? UIImage else {return}
            parent.selectedImage = image
            parent.presentationMode.wrappedValue.dismiss()
        }
        
    }
}
