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
    
    @IBOutlet weak var label: UILabel!

    var current = ["Soft": 300,"Medium": 420, "Hard": 720]
    var timer = Timer()
    var totalTime = 60
    var remainingTime = 0
    var player: AVAudioPlayer!
    
        
    @IBOutlet weak var barProgressView: UIProgressView!
    
        
        @IBAction func hardnessSelected(_ sender: UIButton) {
            label.text = "How do you like your eggs?"
            timer.invalidate()
            let hardness = sender.currentTitle!
            remainingTime = 0
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
            totalTime = current[hardness]!
       
        }
@objc func countdown() {
    remainingTime += 1
    print("\(remainingTime) second")
    if remainingTime <= totalTime {
    barProgressView.progress =  Float(remainingTime) / Float(totalTime)
        
    }
    if totalTime == remainingTime {
        timer.invalidate()
        label.text = "Time's Up"
        remainingTime = 0
        playSound()
        
        
    }
    
    }
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: ".mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
        
}
