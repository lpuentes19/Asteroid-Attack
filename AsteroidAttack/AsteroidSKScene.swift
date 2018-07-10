//
//  AsteroidSKScene.swift
//  AsteroidAttack
//
//  Created by Luis Puentes on 7/9/18.
//  Copyright © 2018 LuisPuentes. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class AsteroidSKScene: SKScene {
    
    var asteroid: SKSpriteNode!

    override func didMove(to view: SKView) {
        backgroundColor = UIColor.black
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
    }
    
    @objc func addAsteroids() {
        asteroid = SKSpriteNode(imageNamed: "asteroid")
        
        let randomAsteroidPosition = GKRandomDistribution(lowestValue: 0, highestValue: 400)
        let position = CGFloat(randomAsteroidPosition.nextInt())
        
        asteroid.position = CGPoint(x: position, y: self.frame.size.height + asteroid.size.height )
        asteroid.physicsBody = SKPhysicsBody(rectangleOf: asteroid.size)
        asteroid.physicsBody?.isDynamic = true
        
        self.addChild(asteroid)
        
        let animationDuration: TimeInterval = 6
        
        var actionArray = [SKAction]()
        actionArray.append(SKAction.move(to: CGPoint(x: position, y: -asteroid.size.height), duration: animationDuration))
        actionArray.append(SKAction.removeFromParent())
        
        asteroid.run(SKAction.sequence(actionArray))
    }
}
