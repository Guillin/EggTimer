//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    
    var totalTime = 0
    var secondsPassed = 0

    
    // Init Audio class player to play alarm sound at the end
    var player: AVAudioPlayer!
    
    
    var timer = Timer()

   

    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        
        timer =  Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        secondsPassed = 0
        progressBar.progress = 0
        
        
    }
    
    @objc func updateTimer(){
        if secondsPassed < totalTime {
            
            secondsPassed+=1
            
            let perProgress = Float(secondsPassed)/Float(totalTime)
            titleLabel.text = "\(secondsPassed) seconds"
            
            progressBar.progress = perProgress
            
            
            
        } else {
            timer.invalidate()
            titleLabel.text = "DONE!"
            
            //            find sound file to play
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            
            
            // Play Sound
            player.play()
            
        }
    }
    
}
