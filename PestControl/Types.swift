//
//  Types.swift
//  PestControl
//
//  Created by justin baker on 2018-06-07.
//  Copyright © 2018 Ray Wenderlich. All rights reserved.
//
import Foundation
import SpriteKit

enum Direction : Int {
  case forward = 0, backward, left, right
}

extension SKTexture {
  convenience init(pixelImageNamed: String){
    self.init(imageNamed: pixelImageNamed)
    self.filteringMode = .nearest
  }
}
