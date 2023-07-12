//
//  AudioResources.swift
//  edith
//
//  Created by Evelyn Megawati Tiffany on 10/07/23.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer!

class Sounds{
    
    static var audioPlayer:AVAudioPlayer?
    
    static func playSounds(soundfile: String){
        if let path = Bundle.main.path(forResource: soundfile, ofType: nil){
            do{
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                          audioPlayer?.prepareToPlay()
                          audioPlayer?.play()
            
            }catch{
                print("Error")
            }
        }
    }
    
}

class SoundControl{
    func playMainStoryAudio(){
        let url = Bundle.main.url(forResource: "MainStoryBgm2", withExtension: "m4a")
                        
                        guard url != nil else {
                            return
                        }
                        
                        do {
                            audioPlayer = try AVAudioPlayer(contentsOf: url!)
                            audioPlayer?.play()
                            audioPlayer?.numberOfLoops = -1
                            audioPlayer.volume = 0.8
                        } catch {
                            print("\(error)")
                        }
    }
    func playCoinSFX(){
        Sounds.playSounds(soundfile: "DropCoinSfx.m4a")
    }
    func playBrokenEdith(){
        Sounds.playSounds(soundfile: "BrokenEdith.m4a")
    }
    func playButtonSFX(){
        Sounds.playSounds(soundfile: "ButtonSfx.m4a")
    }
    func playEdithPowerUp(){
        Sounds.playSounds(soundfile: "EdithPowerUp.m4a")
    }
    func playEdithTalk(){
        Sounds.playSounds(soundfile: "EdithTalk.m4a")
    }
    func playMapSong(){
        let url = Bundle.main.url(forResource: "WholesomeShuffleBgm", withExtension: "m4a")
                        
                        guard url != nil else {
                            return
                        }
                        
                        do {
                            audioPlayer = try AVAudioPlayer(contentsOf: url!)
                            audioPlayer?.play()
                            audioPlayer?.numberOfLoops = -1
                            audioPlayer.volume = 0.8
                        } catch {
                            print("\(error)")
                        }
    }
    func playCorrectSFX(){
        Sounds.playSounds(soundfile: "CorrectSfx.m4a")
    }
    func playWrongSFX(){
        Sounds.playSounds(soundfile: "WrongSfx.m4a")
    }
    func playNextButtonSFX(){
        Sounds.playSounds(soundfile: "NextButtonSfx.m4a")
    }
}
