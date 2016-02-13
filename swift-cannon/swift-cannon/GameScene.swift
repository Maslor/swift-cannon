    //
//  GameScene.swift
//  swift-cannon
//
//  Created by Gabriel Freire on 11/02/16.
//  Copyright (c) 2016 maslor. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var cannon: SKSpriteNode!
    var touchLocation: CGPoint = CGPointZero
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        cannon = self.childNodeWithName("cannon") as? SKSpriteNode
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        touchLocation = touches.first!.locationInNode(self)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        touchLocation = touches.first!.locationInNode(self)
    }
    
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        let percent = touchLocation.x / size.width
        let newAngle = percent * 180 - 180
        cannon?.zRotation = CGFloat(newAngle) * CGFloat(M_PI) / 180.0
    }
}
