//
//  AudioPlayer.swift
//  Fotos&Fatos
//
//  Created by Charles Ferreira on 25/01/2018.
//  Copyright © 2018 Charles Ferreira. All rights reserved.
//

import UIKit
import AVFoundation

class VoiceOver {
    
    var audio: AVAudioPlayer?
    
    func play(fileNamed name: String, ofType type: String = "mp3") {
        guard let path = Bundle.main.path(forResource: name, ofType: type) else { return }
        
        let url = URL(fileURLWithPath: path)
        do {
            audio = try AVAudioPlayer(contentsOf: url)
            audio?.play()
        } catch {
            print("Erro ao reproduzir áudio")
        }
    }
    
    func stop() {
        audio?.stop()
    }
}
