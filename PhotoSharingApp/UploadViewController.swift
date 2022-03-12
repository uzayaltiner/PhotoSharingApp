//
//  UploadViewController.swift
//  PhotoSharingApp
//
//  Created by Uzay Altıner on 12.03.2022.
//

import UIKit
import Firebase

class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var commentTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        imageView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func selectImage() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true)
        
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func shareButtonTapped(_ sender: Any) {
        let storage = Storage.storage()
        let storageReferance =  storage.reference()
        
        let mediaFolder = storageReferance.child("media")
        
        if let data = imageView.image?.jpegData(compressionQuality: 0.5) {
            
            let uuid = UUID().uuidString
            
            let imageReference = mediaFolder.child("\(uuid).jpg")
            
            imageReference.putData(data, metadata: nil) { (storagemetadata, error) in
                if error != nil {
                    self.errorMessage(title: "Error", message: error?.localizedDescription ?? "Somethings goes wrong.")
                } else {
                    imageReference.downloadURL { (url, error) in
                        if error == nil{
                            let imageURL = url?.absoluteString
                            
                            if let imageURL = imageURL {
                                let firestoreDatabase = Firestore.firestore()
                                
                                let firestorePost = ["imageURL" : imageURL, "comment"  : self.commentTextField.text!, "email" : Auth.auth().currentUser!.email, "date": FieldValue.serverTimestamp() ] as [String : Any]
                                
                                firestoreDatabase.collection("Post").addDocument(data: firestorePost) { (error) in
                                    
                                    if error != nil {
                                        self.errorMessage(title: "Error", message: error?.localizedDescription ?? "Somethings goes wrong.")
                                    } else {
                                        self.commentTextField.text = ""
                                        self.imageView.image = UIImage(named: "defaultImage")
                                        self.tabBarController?.selectedIndex = 0
                                    }
                                    
                                }
                            }
                        }
                    }
                }
            }
        }
        
    }
    
    
    func errorMessage(title: String, message: String) {
        let errorMessage = UIAlertController(title: title , message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default)
        errorMessage.addAction(ok)
        self.present(errorMessage, animated: true)
    }
    
}
