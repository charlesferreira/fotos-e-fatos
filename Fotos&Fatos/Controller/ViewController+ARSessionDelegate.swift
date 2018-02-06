//
//  ViewController+ARSessionDelegate.swift
//  Fotos&Fatos
//
//  Created by Charles Ferreira on 25/01/2018.
//  Copyright © 2018 Charles Ferreira. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

extension ViewController {
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        // Adiciona novos planos descobertos, enquanto não tiver posicionado as fotos
        guard appState == .placingPhotos,
            let planeAnchor = anchor as? ARPlaneAnchor else { return }
        
        // Cria e posiciona uma geometria de plano do SceneKit no local do plano encontrado
        let plane = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
        let planeNode = SCNNode(geometry: plane)
        planeNode.simdPosition = float3(planeAnchor.center.x, 0, planeAnchor.center.z)
        planeNode.opacity = 0.25
        
        // Corrige a rotação do plano do SceneKit, que originalmente é sempre vertical
        planeNode.eulerAngles.x = -.pi / 2
        
        // Adiciona o nó do plano à cena
        node.addChildNode(planeNode)
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        // Se já posicionou as fotos, pula esta etapa
        guard appState == .placingPhotos else { return }
        
        // Garante que o plano sendo atualizado possui a configuração correta, conforme criamos acima
        guard let planeAnchor = anchor as?  ARPlaneAnchor,
            let planeNode = node.childNodes.first,
            let plane = planeNode.geometry as? SCNPlane
            else { return }
        
        // Corrige a posição e as dimensões do plano
        planeNode.simdPosition = float3(planeAnchor.center.x, 0, planeAnchor.center.z)
        plane.width = CGFloat(planeAnchor.extent.x)
        plane.height = CGFloat(planeAnchor.extent.z)
    }

}
