//
//  GameScene.swift
//  provagioco1
//a
//  Created by Aurora Messina queen regin on 04/02/22.
//

import SpriteKit
import GameplayKit


//definisci i nodi e le loro proprietà


class GameScene: SKScene {
    let nodo = SKNode ()
    let sfondo = SKSpriteNode(imageNamed: "sfondi")
    let scritta = SKLabelNode(text: "ok")
    
    
    
    let tasti =  SKSpriteNode(imageNamed: "pulsanti");
    
    //appendi i nodi, gestisci posizione e dimensione
    //con questa funzione carichiamo la schermata
    override func sceneDidLoad() {
        addChild(sfondo)
        addChild(tasti)
        addChild(scritta)
        sfondo.position = CGPoint(x: frame.midX, y: frame.midY)
        tasti.position = CGPoint(x: frame.midX, y: frame.midY)
        sfondo.zPosition = -1
        tasti.zPosition = 1
        scritta.zPosition = 2
        scritta.fontSize = 25.0
        scritta.fontColor = .blue
        scritta.fontName = "Futura Bold"
        scritta.position = CGPoint(x: tasti.frame.midX, y: tasti.frame.midY )
        
        
        
    }
    
    //con le prime due variabili intercettiamo informazione sul punto
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        scritta.run(SKAction.move(to: CGPoint(x: frame.midX, y: (tasti.position.y + 40.0)), duration: 2.0))
        
        let tocco = touches.first
        let posizione = tocco?.location (in: self)
        
        let nodoToccato = nodes(at: posizione!)
        
        if (tasti.position.x == nodoToccato.first?.position.x && tasti.position.y == nodoToccato.first?.position.y)
        { scene?.view?.presentScene(MappaScene())
        }
        
        
    }
}
