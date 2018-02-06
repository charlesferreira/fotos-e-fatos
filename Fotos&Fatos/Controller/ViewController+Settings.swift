//
//  ViewController+Settings.swift
//  Fotos&Fatos
//
//  Created by Charles Ferreira on 25/01/2018.
//  Copyright © 2018 Charles Ferreira. All rights reserved.
//

import UIKit

extension ViewController {
    
    @IBAction func openSettings() {
        settingsContainer.isHidden = false
        settingsButton.isHidden = true
    }
    
    func closeSettings() {
        settingsContainer.isHidden = true
        settingsButton.isHidden = false
    }
    
    @IBAction func toggleVoiceOver(sender: UISwitch) {
        voiceOver.stop()
    }
    
    @IBAction func toggleSubtitles(sender: UISwitch) {
        subtitlesLabel.isHidden = !sender.isOn
    }
    
}
