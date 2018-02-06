//
//  ViewController.swift
//  Fotos&Fatos
//
//  Created by Charles Ferreira on 24/01/2018.
//  Copyright © 2018 Charles Ferreira. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate, ARSessionDelegate {

    @IBOutlet var sceneView: ARSCNView!

    @IBOutlet var settingsContainer: UIView!
    @IBOutlet var settingsButton: UIButton!
    @IBOutlet var voiceOverSwitch: UISwitch!
    @IBOutlet var subtitlesSwitch: UISwitch!
    @IBOutlet var subtitlesLabel: UILabel!
    
    var appState = AppState.placingPhotos
    
    let voiceOver = VoiceOver()
    let subtitles = Subtitles()
    
    func describe(_ subject: String) {
        if voiceOverSwitch.isOn {
            voiceOver.play(fileNamed: subject)
        }
        if subtitlesSwitch.isOn {
            subtitles.play(scriptNamed: subject)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Define delegates
        sceneView.delegate = self
        sceneView.session.delegate = self
        
        // Configura o reconhecimento de toques
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapped(recognizer:)))
        tapRecognizer.numberOfTapsRequired = 1
        tapRecognizer.numberOfTouchesRequired = 1
        sceneView.gestureRecognizers = [tapRecognizer]
        
        // Inicializa a narração e legendas
        subtitles.label = subtitlesLabel
        
        // Fornece as instruções iniciais
        describe("Intro")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Configura e inicia a sessão
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        sceneView.session.run(configuration)
        
        // Impede que a tela escureça por falta de interação
        UIApplication.shared.isIdleTimerDisabled = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pausa a sessão
        sceneView.session.pause()
    }
}
