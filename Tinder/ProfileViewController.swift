//
//  ProfileViewController.swift
//  Tinder
//
//  Created by Jesus Andres Bernal Lopez on 10/30/18.
//  Copyright © 2018 Jesus Andres Bernal Lopez. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    var image: UIImage!
    @IBOutlet weak var cardImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardImageView.image = image
    }
    @IBAction func onTap(_ sender: Any) {
        print("tapped")
        self.dismiss(animated: true, completion: nil)
    }
    
}
