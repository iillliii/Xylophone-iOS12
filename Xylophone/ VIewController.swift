//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate{
    
    var audioPlayer:AVAudioPlayer!
    var soundArray = ["note1","note2","note3","note4","note5","note6","note7"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
        
        let soundName : String = soundArray[sender.tag-1]
        
        playSound(soundName: soundName, type: "wav")
    }
    
    func playSound(soundName : String, type : String) -> Void{
        let note = Bundle.main.url(forResource: soundName, withExtension: type)
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: note!)
        }catch let error as NSError{
            print(error)
        }

        audioPlayer.play()

    }

}

