//
//  ViewController.swift
//  IntergalacticTraveler
//
//  Created by Adam Zlomke on 7/12/22.
//

import UIKit

struct Destination{
    var imageName = String()
    var labelText = "Label Text"
    var factText = "Fact"
    var color = UIColor.red
    
    
}






class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayLocations.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayLocations[row].labelText
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.locationChosen = arrayLocations[row]
    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return NSAttributedString(string: arrayLocations[row].labelText, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
    }
    
    
    // Outlets
    
    
    @IBOutlet weak var locationPickerView: UIPickerView!
    
    
    @IBOutlet weak var directionMessage: UILabel!
    
    @IBOutlet weak var openingMessage: UILabel!
    
    // Variables
    
    var locationChosen = Destination(imageName: "lambeauField", labelText: "Lambeau Field", factText: "Lambeau opened in 1957")
    var destinationImage = ""
    var destinationLabel = ""
    var arrayLocations = [Destination]()
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        directionMessage.layer.masksToBounds = true
        directionMessage.layer.cornerRadius = 30
        
        openingMessage.layer.masksToBounds = true
        openingMessage.layer.cornerRadius = 30
        
        
        let lambeau = Destination(imageName: "LambeauField", labelText: "Lambeau Field", factText: "Lambeau opened in 1957", color: .green)
        
        let memorialStadium = Destination(imageName: "memorialStadium", labelText: "Memorial Stadium", factText: "Memorial Stadium is home to the longest sell out streak", color: #colorLiteral(red: 1, green: 0, blue: 0.1033049896, alpha: 1))
        
        let brewersStadium = Destination(imageName: "brewers", labelText: "Brewer's Stadium", factText: "I don't know anything about the Brewers", color: #colorLiteral(red: 0.003005818697, green: 0.0001619780669, blue: 1, alpha: 1))
        
        let philly = Destination(imageName: "76ers", labelText: "Wells Fargo Center", factText: "I also don't know any facts about the 76ers", color: #colorLiteral(red: 1, green: 0, blue: 0.1033049896, alpha: 1))
        
        
        let cubs = Destination(imageName: "Cubs", labelText: "Wrigley Field", factText: "The Cubs are located in Chicago", color: .blue)
        
        arrayLocations = [lambeau, memorialStadium, brewersStadium, philly, cubs]
        self.locationPickerView.dataSource = self
        self.locationPickerView.delegate = self
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "destinationSegue" {
            let nav = segue.destination as! DestinationViewController
            nav.destination = locationChosen
            
        }
    }
    
    
    
    @IBAction func swipeToLocation(_ sender: Any) {
        
        performSegue(withIdentifier: "destinationSegue", sender: nil)
        
    }
    
    
    @IBAction func unwind(segue: UIStoryboardSegue){
        
    }
    
    
}

