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
        currentTaps++
        updateTapsLabel()
        
        if isGameOver() {
            restartGame()
        }
    }
    
    // Start game function
    @IBAction func onPlayButtonPressed(sender: UIButton!) {
        if let howManyTapsNumber: Int = Int(howManyTapsText.text!)!{
        
            if howManyTapsNumber > 0 && howManyTapsText.text != "" {
        
                // Hide splash screen controls
                logoImg.hidden = true
                howManyTapsText.hidden = true
                playButton.hidden = true
            
                // Show game controls
                tapButton.hidden = false
                tapsLabel.hidden = false
                balloon.hidden = false
            
                maxTaps = Int(howManyTapsText.text!)!
                currentTaps = 0
            
                updateTapsLabel()
            
                if isGameOver() {
                    restartGame()
                }
            }
        }
    }
    
    func isGameOver() -> Bool {
        if currentTaps >= maxTaps {
            return true
        } else {
            return false
        }
    }
    
    func restartGame() {
        maxTaps = 0
        howManyTapsText.text = ""
        
        // Hide splash screen controls
        logoImg.hidden = false
        howManyTapsText.hidden = false
        playButton.hidden = false
        
        // Show game controls
        tapButton.hidden = true
        tapsLabel.hidden = true
        balloon.hidden = true

    }
    
    func updateTapsLabel() {
        tapsLabel.text = "\(currentTaps) Taps"
    }

}

