//
//  ViewController+TapRecognizer.swift
//  Fotos&Fatos
//
//  Created by Charles Ferreira on 25/01/2018.
//  Copyright © 2018 Charles Ferreira. All rights reserved.
//

import UIKit
import SceneKit

extension ViewController {
    
    @objc func tapped(recognizer: UITapGestureRecognizer) {
        closeSettings()
        
        let location = recognizer.location(in: sceneView)
        switch appState {
        case .placingPhotos:
            placePhotos(at: location)
            
        case .readyToDescribe:
            describePhoto(at: location)
        }
    }
    
    fileprivate func placePhotos(at location: CGPoint) {
        // tenta encontrar um plano (real) no local do toque
        let hits = sceneView.hitTest(location, types: [.existingPlaneUsingExtent, .estimatedHorizontalPlane])
        
        if let hitPosition = hits.first?.worldTransform.columns.3 {
            // Cria uma nova cena e posiciona-a no centro do plano
            let scene = SCNScene(named: "art.scnassets/scenes/photos.scn")!
            scene.rootNode.position = SCNVector3Make(hitPosition.x, hitPosition.y, hitPosition.z)
            
            // Remove todos os outros nós da cena (basicamente os planos adicionados anteriormente)
            sceneView.scene.rootNode.enumerateChildNodes { child, _ in
                child.removeFromParentNode()
            }
            
            // Adiciona a nova cena à simulação
            sceneView.scene.rootNode.addChildNode(scene.rootNode)
            
            // Atualiza o estado do app
            appState = .readyToDescribe
            
            // Fornece as instruções adicionais
            describe("Ready")
        }
    }
    
    fileprivate func describePhoto(at location: CGPoint) {
        // Tenta encontrar um nó no local do toque
        let hits = sceneView.hitTest(location, options: nil)
        
        guard let photo = hits.first?.node.parent?.name else { return }

        // Descreve a photo
        describe(photo)
    }
}
