//
//  Post.swift
//  PhotoSharingApp
//
//  Created by Uzay Altıner on 12.03.2022.
//

import Foundation

class Post {
    var email: String
    var imageURL: String
    var comment: String
    
    init(email: String, imageURL: String, comment: String) {
        self.imageURL = imageURL
        self.email = email
        self.comment = comment
    }
}
