//
//  DestinationViewController.swift
//  IntergalacticTraveler
//
//  Created by Adam Zlomke on 7/12/22.
//

import UIKit

class DestinationViewController: UIViewController {


var destination = Destination()
var colorChoice = UIColor()

@IBOutlet weak var funGrowingLabelj: UILabel!

@IBOutlet weak var locationLabel: UILabel!

@IBOutlet weak var factLabel: UILabel!

@IBOutlet weak var locationImage: UIImageView!

@IBOutlet weak var swipeMessage: UILabel!

override func viewDidLoad() {
    super.viewDidLoad()
    
    locationImage.image = UIImage(named: destination.imageName)
    locationLabel.text = "Welcome To \(destination.labelText)"
    factLabel.text = destination.factText
    self.view.backgroundColor = destination.color
    swipeMessage.layer.masksToBounds = true
    swipeMessage.layer.cornerRadius = 30
    factLabel.layer.masksToBounds = true
    factLabel.layer.cornerRadius = 30
    
    locationLabel.layer.masksToBounds = true
    locationLabel.layer.cornerRadius = 30
}



@IBAction func pinchRecognizer(_ sender: UIPinchGestureRecognizer) {
    
    
    var size = sender.scale * 20
    
    print(size)
    
    funGrowingLabelj.font = UIFont(name: "Chalkduster", size: size)
}

@IBAction func swipeBack(_ sender: UISwipeGestureRecognizer) {
    
    
    performSegue(withIdentifier: "Unwind", sender: nil)
    
}

    
}
