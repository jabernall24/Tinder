//
//  CardsViewController.swift
//  Tinder
//
//  Created by Jesus Andres Bernal Lopez on 10/26/18.
//  Copyright © 2018 Jesus Andres Bernal Lopez. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {
    
    var cardInitialCenter: CGPoint!
    @IBOutlet weak var cardImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardInitialCenter = cardImageView.center
    }
    @IBAction func onPan(_ sender: Any) {
        var locationBegin: CGPoint!
        let panSender = sender as! UIPanGestureRecognizer
        let translation = panSender.translation(in: view)
        let velocity = panSender.velocity(in: view)
//         let translation = sender.translation(in: view)

        locationBegin = panSender.location(in: cardImageView)
        
        if panSender.state == .began{
            print("began")
        }
        if panSender.state == .changed{
            self.cardImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
            
            self.cardImageView.center = CGPoint(x: self.cardInitialCenter.x + translation.x, y: self.cardInitialCenter.y + translation.y)

            if locationBegin.y > self.cardImageView.center.y{
                UIView.animate(withDuration: 0.5) {
                    self.cardImageView.transform = self.cardImageView.transform.rotated(by: -translation.x/1000)
                }
            }
            else{
                UIView.animate(withDuration: 0.5) {
                    self.cardImageView.transform = self.cardImageView.transform.rotated(by: translation.x/1000)
                }
            }
            
        }
        if panSender.state == .ended{
            if panSender.translation(in: cardImageView).x > 50 || panSender.translation(in: cardImageView).x < -50{
                if velocity.x < 0{
                    UIView.animate(withDuration: 0.5) {
                        self.cardImageView.center = CGPoint(x: -(self.cardImageView.frame.width * 2), y: self.cardInitialCenter.y + translation.y)
                    }
                }else{
                    UIView.animate(withDuration: 0.5) {
                        self.cardImageView.center = CGPoint(x: self.cardImageView.frame.width * 2, y: self.cardInitialCenter.y + translation.y)
                    }
                }

                self.cardImageView.isHidden = true
            }else{
                cardImageView.transform = .identity
                print("do nothing")
            }
        }
    }
    
    @IBAction func onTap(_ sender: Any) {
        self.performSegue(withIdentifier: "profileSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let profileViewController = segue.destination as? ProfileViewController{
            profileViewController.image = cardImageView.image
        }
    }
    
}
