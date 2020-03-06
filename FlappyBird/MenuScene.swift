//
//  MenuScene.swift
//  FlappyBird
//
//  Created by graphic on 2020-02-21.
//  Copyright © 2020 graphic. All rights reserved.
//

import SpriteKit

class MenuScene: SKScene {
    
    var background = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        
        if arc4random() % 2 == 0 {
            background = SKSpriteNode(imageNamed: "background1")
            background.name = "background1"
        } else {
            background = SKSpriteNode(imageNamed: "background2")
            background.name = "background2"
        }
        
        background.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        background.zPosition = 0
        self.addChild(background)
        
        let titleFlappy = SKSpriteNode(imageNamed: "flappybird_30")
        titleFlappy.position = CGPoint(x: self.size.width / 2.5, y: self.size.height * 0.7)
        titleFlappy.zPosition = 1
        titleFlappy.setScale(2)
        self.addChild(titleFlappy)
        
        let titleBird = SKSpriteNode(imageNamed: "flappybird_31")
        titleBird.position = CGPoint(x: self.size.width / 1.5, y: self.size.height * 0.7)
        titleBird.zPosition = 1
        titleBird.setScale(2)
        self.addChild(titleBird)
        
        let playBtn = SKSpriteNode(imageNamed: "flappybird_41")
        playBtn.name = "playBtn"
        playBtn.position = CGPoint(x: self.size.width / 2.5, y: self.size.height * 0.3)
        playBtn.setScale(2)
        playBtn.zPosition = 1
        self.addChild(playBtn)
        
        let scoreBtn = SKSpriteNode(imageNamed: "flappybird_32")
        scoreBtn.name = "scoreBtn"
        scoreBtn.position = CGPoint(x: self.size.width / 1.5, y: self.size.height * 0.3)
        scoreBtn.setScale(2)
        scoreBtn.zPosition = 1
        self.addChild(scoreBtn)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if let location = touch?.location(in: self) {
            let nodesArray = self.nodes(at: location)
            if nodesArray.first?.name == "playBtn" {
                let scene = GameScene(size: self.size)
                scene.background = self.background
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene)
            }
            
            if nodesArray.first?.name == "scoreBtn" {
                           let scene = ScoreScene(size: self.size)
                           scene.background = self.background
                           scene.scaleMode = .aspectFill
                           self.view?.presentScene(scene)
                       }
        }
    }
}
