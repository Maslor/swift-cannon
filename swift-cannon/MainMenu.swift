//
//  MainMenu.swift
//  swift-cannon
//
//  Created by Gabriel Freire on 11/02/16.
//  Copyright © 2016 maslor. All rights reserved.
//

import SpriteKit

class MainMenu: SKScene {
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let game: GameScene = GameScene(fileNamed:"GameScene")!
        self.view?.presentScene(game)
    }

}
