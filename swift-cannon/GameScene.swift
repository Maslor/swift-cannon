    //
//  GameScene.swift
//  swift-cannon
//
//  Created by Gabriel Freire on 11/02/16.
//  Copyright (c) 2016 maslor. All rights reserved.
//

import SpriteKit
    
let wallMask:UInt32 = 0x1 << 0 // 1
let ballMask:UInt32 = 0x1 << 1 // 1
let pegMask:UInt32 = 0x1 << 2 // 4
let squareMask:UInt32 = 0x1 << 3 // 8
    
class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var cannon: SKSpriteNode!
    var touchLocation: CGPoint = CGPointZero
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        cannon = self.childNodeWithName("cannon") as? SKSpriteNode
        self.physicsWorld.contactDelegate = self
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        touchLocation = touches.first!.locationInNode(self)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        touchLocation = touches.first!.locationInNode(self)
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let ball: SKSpriteNode = SKScene(fileNamed: "Ball")?.childNodeWithName("ball")! as! SKSpriteNode
        ball.removeFromParent()
        self.addChild(ball)
        ball.position = cannon.position
        ball.zPosition = 0
        let angleInRadians = Float(cannon.zRotation)
        let speed = CGFloat(75.0)
        let vx: CGFloat = CGFloat(cosf(angleInRadians)) * speed
        let vy: CGFloat = CGFloat(sinf(angleInRadians)) * speed
        ball.physicsBody?.applyImpulse(CGVectorMake(vx, vy), atPoint: ball.position)
        ball.physicsBody?.collisionBitMask = wallMask | ballMask | pegMask
        
    }
    
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        let percent = touchLocation.x / size.width
        let newAngle = percent * 180 - 180
        cannon?.zRotation = CGFloat(newAngle) * CGFloat(M_PI) / 180.0
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        print("Contact!")
    }
}
