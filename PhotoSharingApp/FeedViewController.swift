//
//  FeedViewController.swift
//  PhotoSharingApp
//
//  Created by Uzay Altıner on 12.03.2022.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        cell.commentText.text = "hi youtube"
        cell.emainText.text = "admin@admin.com"
        cell.postImageView.image = UIImage(named: "defaultImage")
        return cell
    }

}
