//
//  ViewController.swift
//  TeaTimer
//
//  Created by Salman Mohammed on 13/04/1441 AH.
//  Copyright © 1441 Salman Mohammed. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {

 var player: AVAudioPlayer?
   //This timeing is almost not sure
    var teaTime = ["Light": 60, "Medium": 150, "Strong": 300]
    
      var timer = Timer()
      var totalTime = 0
      var secondPassed = 0

    @IBOutlet weak var textLable: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func strongerSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let stronger = sender.currentTitle!
        
        print(sender.currentTitle!)
        
          totalTime = teaTime[stronger]!
        
        
              progressBar.progress = 0.0
              secondPassed = 0
              textLable.text = stronger
         
        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateCounter), userInfo:nil, repeats: true)
          
        
        
    }
    
    @objc func updateCounter() {

        if secondPassed < totalTime {
                   
                   secondPassed += 1
                   progressBar.progress = Float(secondPassed) / Float(totalTime)
                   
                print(Float(secondPassed) / Float(totalTime))
                   
                  } else {
               timer.invalidate()
               textLable.text = "DONE!"
                   playSound()
           }
       
              }
    
    func playSound() {
              let url = Bundle.main.url(forResource: "8271_iphone_2", withExtension: "mp3")
              player = try! AVAudioPlayer(contentsOf: url!)
           player!.play()
                      
          }
    
}

