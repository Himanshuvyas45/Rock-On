//
//  ViewController.swift
//  RockOn
//
//  Created by admin on 03/05/19.
//  Copyright © 2019 professional. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    
    @IBOutlet weak var musicName: UILabel!
    
    let musicList = [ "Ishq Ka Raja - Addy Nagar", "Teri Mitti - Kesari", "Chale Aana - De De Pyaar De", "Official Video - Humnava Mere Song _ Jubin Nautiyal _ Manoj Muntashir _ Rocky - Shiv _ Bhushan Kumar"]
    
    var myAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makePlayerReady()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
   
    @IBAction func shuffultapped(_ sender: Any) {
        makePlayerReady()
        myAudioPlayer.play()
    }
    
    
    @IBAction func pauseTapped(_ sender: Any) {
        myAudioPlayer.pause()
    }
    
    @IBAction func stopTapped(_ sender: Any) {
        myAudioPlayer.stop()
        myAudioPlayer.currentTime = 5
    }
    
    func makePlayerReady(){
        do {
            
            //generate a random number
            let randomMusic = Int(arc4random_uniform(4))
            print(randomMusic)
            let selectedMusic = musicList[randomMusic]
            
            //audio part
            
            let myURL = URL(fileURLWithPath: Bundle.main.path(forResource: selectedMusic, ofType: "mp3")!)
            
            myAudioPlayer = try AVAudioPlayer(contentsOf: myURL)
            myAudioPlayer.prepareToPlay()
            
            
        } catch {
            print(error)
        }
    }
    
    
    
}


//Label should display proper name of music












