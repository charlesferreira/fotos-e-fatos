//
//  Subtitles.swift
//  Fotos&Fatos
//
//  Created by Charles Ferreira on 25/01/2018.
//  Copyright © 2018 Charles Ferreira. All rights reserved.
//

import Foundation
import UIKit

class Subtitles {
    
    static fileprivate let scripts: [String: [(start: TimeInterval, text: String?)]] = [
        "Abductor": [
            (start:  0.0, text: "Eu comecei a programar em 1999, influenciado por um amigo na escola, e nunca mais parei."),
            (start:  4.5, text: "Meu primeiro emprego como programador foi em 2007, e em 2010 entrei pro Ministério Público do Paraná."),
            (start:  9.2, text: "Sou formado em Redes de Computadores e especialista em Desenvolvimento de Jogos, pela PUCPR."),
            (start: 13.2, text: "Essa aí é uma foto do meu primeiro jogo na especialização, chamado \"Abductor\"."),
            (start: 17.5, text: nil),
        ],
        "Banda": [
            (start:  0.0, text: "Em 2001, comecei a tocar baixo."),
            (start:  2.2, text: "Esse foi um dos meus principais hobbies, por mais de 10 anos."),
            (start:  4.8, text: "Minha banda se chama Zero-Zero UFO, e tocamos principalmente hardcore. 👽"),
            (start:  8.0, text: "Hoje em dia a gente se reúne bem menos, mas ainda fazemos um som de vez em quando!"),
            (start: 11.5, text: nil),
        ],
        "Casamento": [
            (start: 0.0, text: "Em 2006 eu conheci a Camilla, nas aulas de danças de salão."),
            (start: 3.8, text: "Dançamos diversos estilos, mas foi no forró que a gente se apaixonou."),
            (start: 6.8, text: "Estamos juntos desde então e casamos em 2011! ❤️"),
            (start: 9.0, text: nil),
        ],
        "Charles": [
            (start: 0.0, text: "Esse cara sou eu! 😄"),
            (start: 2.0, text: nil),
        ],
        "Eddie": [
            (start: 0.0, text: "Nós temos dois gatos em casa. Esse aí é o Eddie!"),
            (start: 3.2, text: "Nossa vontade era adotar pelo menos uma dúzia de gatos, mas a casa é pequena. 😸"),
            (start: 6.2, text: nil),
        ],
        "Infancia": [
            (start:  0.0, text: "Eu nasci em 1986, no bairro do Uberaba, em Curitiba."),
            (start:  3.5, text: "Meus pais se separaram quando eu tinha uns 5 anos, então cresci entre uma casa e outra."),
            (start:  7.0, text: "Na infância brinquei na rua com a piazada do bairro,"),
            (start:  9.0, text: "mas ganhei um video game quando tinha uns 7 anos, aí já viu né! 😂"),
            (start: 12.0, text: nil),
        ],
        "Irmaos": [
            (start:  0.0, text: "Eu tenho vários irmãos, e sou o mais velho entre eles."),
            (start:  2.6, text: "Do lado da minha mãe (foto de cima), tem o Thiago, a Barbara e a Luna."),
            (start:  6.7, text: "Da parte do meu pai (foto de baixo), tem a Barbara de novo, o Afonso Miguel e a Valentina."),
            (start: 11.0, text: nil),
        ],
        "Natureza": [
            (start: 0.0, text: "Eu gosto de passeios na natureza. Praia, trilha, cachoeira."),
            (start: 3.5, text: "Essa foto é na região dos canions, em Cambará do Sul, nos Aparados da Serra."),
            (start: 7.0, text: nil),
        ],
        "Intro": [
            (start:  0.0, text: "E aí, Beleza? Aqui é o Charles!"),
            (start:  2.5, text: "Eu trouxe umas fotos pra te mostrar e falar um pouco sobre mim,"),
            (start:  4.8, text: "mas primeiro eu preciso encontrar uma superfície plana."),
            (start:  7.2, text: "Tente mover o dispositivo lentamente, apontando a câmera pra uma mesa, ou para o chão."),
            (start: 11.0, text: "Quando aparecer um plano na tela, você pode tocar nele que eu posiciono as fotos pra você, ok?"),
            (start: 15.0, text: nil),
        ],
        "Ready": [
            (start: 0.0, text: "Beleza! Aqui estão as minhas fotos."),
            (start: 2.5, text: "Você pode tocar em cada uma delas para saber um pouco mais sobre mim."),
            (start: 5.8, text: nil),
        ]
    ]
    
    var label: UILabel?
    var version = 0
    
    func play(scriptNamed name: String) {
        guard let script = Subtitles.scripts[name], script.count > 0 else { return }
        
        // xunxo ;(
        version += 1
        let currentVersion = version
        
        // Agenda a sequência de textos da legenda
        for subtitle in script {
            DispatchQueue.main.asyncAfter(deadline: .now() + subtitle.start, execute: {
                guard currentVersion == self.version else { return }
                self.label?.text = subtitle.text
            })
        }
    }
    
}
