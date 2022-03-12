//
//  FeedCell.swift
//  PhotoSharingApp
//
//  Created by Uzay Altıner on 12.03.2022.
//

import UIKit

class FeedCell: UITableViewCell {
    @IBOutlet weak var emainText: UILabel!
    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var commentText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
