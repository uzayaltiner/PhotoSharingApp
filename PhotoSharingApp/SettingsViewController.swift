//
//  SettingsViewController.swift
//  PhotoSharingApp
//
//  Created by Uzay Altıner on 12.03.2022.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func exitButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "toLoginVC", sender: nil)
    }
    
}
