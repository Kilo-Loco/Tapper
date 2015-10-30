//
//  ViewController.swift
//  Tapper
//
//  Created by Kyle Lee on 10/28/15.
//  Copyright © 2015 Kyle Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    // Properties
    var maxTaps : Int = 0
    var currentTaps : Int = 0
    
    // Variables
    @IBOutlet weak var logoImg : UIImageView!
    @IBOutlet weak var howManyTapsText : UITextField!
    @IBOutlet weak var playButton : UIButton!
    
    @IBOutlet weak var tapButton : UIButton!
    @IBOutlet weak var tapsLabel : UILabel!
    @IBOutlet weak var balloon : UIImageView!
    
    @IBAction func tapperTapped(sender: UIButton!) {
        self.currentTaps++
        self.updateTapsLabel()
        
        if isGameOver() {
            let alertController: UIAlertController = UIAlertController(title: "You did it!", message: "Good Job", preferredStyle: .Alert)
            let okayAction: UIAlertAction = UIAlertAction(title: "I'M AWESOME!", style: .Cancel, handler: nil)
            
            alertController.addAction(okayAction)
            self.presentViewController(alertController, animated: true, completion: nil)
            self.restartGame()
        }
    }
    
    // Start game function
    @IBAction func onPlayButtonPressed(sender: UIButton!) {
        if let howManyTapsNumber: Int = Int(self.howManyTapsText.text!) {
        
            if howManyTapsNumber > 0 && self.howManyTapsText.text != "" {
        
                // Hide splash screen controls
                self.logoImg.hidden = true
                self.howManyTapsText.hidden = true
                self.playButton.hidden = true
            
                // Show game controls
                self.tapButton.hidden = false
                self.tapsLabel.hidden = false
                self.balloon.hidden = false
            
                self.maxTaps = Int(howManyTapsText.text!)!
                self.currentTaps = 0
            
                self.updateTapsLabel()
            
                if self.isGameOver() {
                    self.restartGame()
                }
            }
        } else {
            // Added Alert Controller for invalid number
            let alertController: UIAlertController = UIAlertController(title: "Invalid Number", message: "Please enter an interger.", preferredStyle: .Alert)
            let okayAction: UIAlertAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
            
            alertController.addAction(okayAction)
            self.presentViewController(alertController, animated: true, completion: nil)
            
            self.howManyTapsText.text = ""
        }
    }
    
    // Check if user tapped goal amount of taps
    func isGameOver() -> Bool {
        if self.currentTaps >= self.maxTaps {
            return true
        } else {
            return false
        }
    }
    
    // Resets game
    func restartGame() {
        self.maxTaps = 0
        self.howManyTapsText.text = ""
        
        // Hide splash screen controls
        self.logoImg.hidden = false
        self.howManyTapsText.hidden = false
        self.playButton.hidden = false
        
        // Show game controls
        self.tapButton.hidden = true
        self.tapsLabel.hidden = true
        self.balloon.hidden = true

    }
    
    func updateTapsLabel() {
        self.tapsLabel.text = "\(self.currentTaps) Taps"
    }
    
    // Return/Done hides keyboard
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // Tapping off keyboard hides keyboard
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

}

