//
//  Player.swift
//  PestControl
//
//  Created by justin baker on 2018-06-07.
//  Copyright © 2018 Ray Wenderlich. All rights reserved.
//

import Foundation
import SpriteKit

class Player: SKSpriteNode {
  
  var animations: [SKAction] = []
  
  enum PlayerSettings {
    static let playerSpeed: CGFloat = 280.0
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("Use init()")
  }
  
  init() {
    let texture = SKTexture(pixelImageNamed: "player_ft1")
    super.init(texture: texture, color: .white, size: texture.size())
    
    name = "Player"
    zPosition = 50
    
    physicsBody = SKPhysicsBody(circleOfRadius: size.width/2)
    physicsBody?.restitution = 1.0
    physicsBody?.linearDamping = 0.5
    physicsBody?.friction = 0
    physicsBody?.allowsRotation = false
    
    createAnimations(character: "player")
  }
  
  func move(target: CGPoint) {
    guard let physicsBody = physicsBody else{return}
    
    let newVelocity = (target - position).normalized() * PlayerSettings.playerSpeed
    physicsBody.velocity = CGVector(point: newVelocity)
    checkDirection()
  }
  
  func checkDirection() {
    guard let physicsBody = physicsBody else {return}
    
    let direction = animationDirection(for: physicsBody.velocity)
    
    if direction == .left {
      xScale = abs(xScale)
    }
    
    if direction == .right {
      xScale = -abs(xScale)
    }
    
    run(animations[direction.rawValue], withKey: "animation")
  }
  
}

extension Player: Animatable {}
