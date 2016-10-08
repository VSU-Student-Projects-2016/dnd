//
//  GameScene.swift
//  dwd
//
//  Created by xcode on 08.10.16.
//  Copyright © 2016 VSU. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    private var map : SKTileMapNode?
    private var startpos : CGPoint?
    private var cam : SKCameraNode?
    
    override func didMove(to view: SKView) {
        self.map = self.childNode(withName: "map") as? SKTileMapNode
        self.cam = self.childNode(withName: "Camera") as? SKCameraNode
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        startpos = pos;
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        map?.position.x -= (startpos?.x)! + pos.x
        map?.position.y -= (startpos?.y)! + pos.y
    }
    
    func touchUp(atPoint pos : CGPoint) {
    
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
