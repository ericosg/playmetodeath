//
//  Level1Scene.swift
//  playmetodeath
//
//  Created by developer on 27/06/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation
class Level2Scene: LevelScene {
    
    var _ground: CCSprite?
    
    override init() {
        super.init()
        
        self._level = 2
        self._levelPart = 1
    }
    
    override func didLoadFromCCB() {
        super.didLoadFromCCB()
        
        makeBall(64, offsetY: 100, duration: 1)
        makeBall(256, offsetY: 300, duration: 1)
        makeBall(384, offsetY: 200, duration: 1)
        makeBall(462, offsetY: 500, duration: 3)
        makeBall(30, offsetY: 320, duration: 3)
        makeBall(300, offsetY: 960, duration: 4)
        makeBall(285, offsetY: 1360, duration: 5)
        makeBall(199, offsetY: 2360, duration: 6)
        makeBall(220, offsetY: 360, duration: 5)
        makeBall(500, offsetY: 6500, duration: 9)
        makeBall(400, offsetY: 8560, duration: 10)
        makeBall(344, offsetY: 1700, duration: 11)
        
        moveGround()
        
        makeBall(356, offsetY: 3960, duration: 12)
        makeBall(295, offsetY: 1560, duration: 12.5)
        makeBall(139, offsetY: 4360, duration: 13)
        makeBall(120, offsetY: 2360, duration: 13, end: true)
    }
    
    func makeBall(x: CGFloat, offsetY:CGFloat, duration:CCTime, end: Bool = false, force: Bool = false) {
        let ball = CCBReader.load("Ball")
        ball.position = CGPoint(x: x, y: 768+offsetY)
        
        if let physicsNode = _physicsNode {
            physicsNode.addChild(ball)
        }
        
        ball.physicsBody.affectedByGravity = false
        
        if(force) {
//            let rotationRadians = CC_DEGREES_TO_RADIANS(210)
//            
//            let directionVector = ccp(CGFloat(sinf(rotationRadians)), CGFloat(cosf(rotationRadians)))
//            let ballOffset = ccpMult(directionVector, 50)
//            
//            ball.position = ccpAdd(_launcher!.position, ballOffset)
//            
//            var useTheForceLucas += CGFloat(10000)
//            let force = ccpMult(directionVector, useTheForceLucas)
//            
//            ball.physicsBody.applyForce(force)
        }
        
        let delay = CCActionDelay(duration: duration)
        let holdup = CCActionCallBlock { () -> Void in
            ball.physicsBody.affectedByGravity = true
        }
        
        if(end) {
            let endDelay = CCActionDelay(duration: 10)
            let endCall = CCActionCallBlock(block: { () -> Void in
                self.stageEnd(self)
            })
            
            ball.runAction(CCActionSequence(array: [delay, holdup, endDelay, endCall]))
        } else {
            ball.runAction(CCActionSequence(array: [delay, holdup]))
        }
    }
    
    func moveGround() {
        if let ground = _ground {
            let delay = CCActionDelay(duration: 15)
            let move = CCActionMoveTo(duration: 1, position: CGPoint(x: 256, y: -58))
            let disable = CCActionCallBlock { () -> Void in
                ground.physicsNode().removeChild(ground, cleanup: true)
            }
            
            ground.runAction(CCActionSequence(array: [delay, move, disable]))
        }
    }
}