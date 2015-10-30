//
//  ViewController.swift
//  Tapper
//
//  Created by Kyle Lee on 10/28/15.
//  Copyright © 2015 Kyle Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
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
            let alertController: UIAlertController = UIAlertController(title: "Invalid Number", message: "Please enter an interger.", preferredStyle: .Alert)
            let okayAction: UIAlertAction = UIAlertAction(title: "OK", style: .Cancel, handler: { (action) -> Void in
                //Don't do anything
            })
            
            alertController.addAction(okayAction)
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
            
        }
    }
    
    func isGameOver() -> Bool {
        if self.currentTaps >= self.maxTaps {
            return true
        } else {
            return false
        }
    }
    
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

}

