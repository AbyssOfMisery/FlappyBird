//
//  ScoreScene.swift
//  FlappyBird
//
//  Created by graphic on 2020-02-21.
//  Copyright © 2020 graphic. All rights reserved.
//

import SpriteKit

class ScoreScene: SKScene {
    
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
        
        let menuBtn = SKSpriteNode(imageNamed: "flappybird_23")
        menuBtn.name = "menuBtn"
        menuBtn.position = CGPoint(x: self.size.width / 1.2, y: self.size.height * 0.9)
        menuBtn.setScale(2)
        menuBtn.zPosition = 1
        self.addChild(menuBtn)
        
        
        createScoreBoard()
    }
    func createScoreBoard() {
        let scoreBoard = SKSpriteNode(imageNamed: "flappybird_14")
        scoreBoard.position = CGPoint(x: self.size.width / 2, y: self.size.height * 0.5)
        scoreBoard.zPosition = 1
        scoreBoard.setScale(2)
        self.addChild(scoreBoard)
           
           var medal = SKSpriteNode()
           
        if PhysicsCategory.score >= 100 {
               medal = SKSpriteNode(imageNamed: "medalPlatinum")
        } else if PhysicsCategory.score >= 50 {
               medal = SKSpriteNode(imageNamed: "medalGold")
        } else if PhysicsCategory.score >= 30 {
               medal = SKSpriteNode(imageNamed: "medalSilver")
        } else if PhysicsCategory.score >= 10 {
               medal = SKSpriteNode(imageNamed: "medalBronze")
           }
        medal.position = CGPoint(x: -scoreBoard.size.width * 0.14, y: scoreBoard.size.height * -0.02)
           medal.zPosition = 0.1
           medal.setScale(0.5)
           scoreBoard.addChild(medal)
           
         let score = UserDefaults.standard.integer(forKey: "score")
           let scoreLabel = SKLabelNode(fontNamed: "OpenSans-Italic")
           scoreLabel.fontSize = 13
           scoreLabel.fontColor = .orange
            scoreLabel.setScale(0.5)
        scoreLabel.text = "\(PhysicsCategory.score)"
           scoreLabel.horizontalAlignmentMode = .left
           
        if score == 0 {
               scoreLabel.position = CGPoint(x: scoreBoard.size.width * 0.15, y: scoreBoard.size.height * 0.05)
        } else if score >= 10 {
               scoreLabel.position = CGPoint(x: scoreBoard.size.width * 0.11, y: scoreBoard.size.height * 0.05)
        } else if score >= 100 {
               scoreLabel.position = CGPoint(x: scoreBoard.size.width * 0.08, y: scoreBoard.size.height * 0.05)
           } else {
               scoreLabel.position = CGPoint(x: scoreBoard.size.width * 0.05, y: scoreBoard.size.height * 0.05)
           }
           
           scoreLabel.zPosition = 0.1
           scoreBoard.addChild(scoreLabel)
           
           print("scoreLabel'position is \(scoreLabel.position)")
           print("gmaeScoreBoard'size is \(scoreBoard.size.width)")
           
           let bestScore = UserDefaults.standard.integer(forKey: "bestScore")
           let bestScoreLabel = SKLabelNode(fontNamed: "OpenSans-Italic")
           bestScoreLabel.fontSize = 13
           bestScoreLabel.fontColor = .orange
           bestScoreLabel.text = "\(bestScore)"
           bestScoreLabel.horizontalAlignmentMode = .left
           bestScoreLabel.setScale(0.5)
           if bestScore == 0 {
               bestScoreLabel.position = CGPoint(x: scoreBoard.size.width * 0.19, y: -scoreBoard.size.height * 0.12)
           } else if bestScore >= 10 {
               bestScoreLabel.position = CGPoint(x: scoreBoard.size.width * 0.15, y: -scoreBoard.size.height * 0.12)
           } else if bestScore >= 100 {
               bestScoreLabel.position = CGPoint(x: scoreBoard.size.width * 0.13, y: -scoreBoard.size.height * 0.12)
           } else {
               bestScoreLabel.position = CGPoint(x: scoreBoard.size.width * 0.19, y: -scoreBoard.size.height * 0.12)
           }
           
           bestScoreLabel.zPosition = 0.1
           scoreBoard.addChild(bestScoreLabel)
           
           
           scoreBoard.run(SKAction.sequence([SKAction.moveTo(y: self.size.height / 2, duration: 1), SKAction.run {
               self.speed = 0
               }]))
       }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if let location = touch?.location(in: self) {
            let nodesArray = self.nodes(at: location)
            if nodesArray.first?.name == "menuBtn" {
                   let scene = MenuScene(size: self.size)
                   scene.background = self.background
                   scene.scaleMode = .aspectFill
                   self.view?.presentScene(scene)
               }
        }
    }
}
