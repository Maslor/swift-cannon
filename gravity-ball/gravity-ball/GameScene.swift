//
//  GameScene.swift
//  gravity-ball
//
//  Created by Gabriel Freire on 13/02/16.
//  Copyright (c) 2016 maslor. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var ball:SKSpriteNode!
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
       ball = self.childNodeWithName("ball") as! SKSpriteNode
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        ball.physicsBody?.applyImpulse(CGVector(dx: 0,dy: 100))
      
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        ball.physicsBody?.applyForce(CGVector(dx: 0,dy: -500))
    }
}
