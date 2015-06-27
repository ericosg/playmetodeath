//
//  MenuScene.swift
//  playmetodeath
//
//  Created by developer on 27/06/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation
class LevelScene : CCNode, CCPhysicsCollisionDelegate
{
    var _hero: CCSprite?
    var _physicsNode: CCPhysicsNode?
    
    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        moveHero(touch.locationInNode(self))
    }
    
    override func touchMoved(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        moveHero(touch.locationInNode(self))
    }
    
    func ccPhysicsCollisionPostSolve(pair: CCPhysicsCollisionPair!, hero nodeA: CCNode!, wildcard nodeB: CCNode!) {
        removeHero()
        goToMainScene()
    }
    
    func didLoadFromCCB() {
        userInteractionEnabled = true
        if let physicsNode = _physicsNode {
            physicsNode.collisionDelegate = self
        }
    }
    
    func moveHero(location: CGPoint) {
        if let hero = _hero {
            hero.position =  location
        }
    }
    
    func removeHero() {
        if let hero = _hero {
            hero.removeFromParent()
        }
    }
    
    func goToMainScene() {
        let mainScene = CCBReader.loadAsScene("MainScene")
        CCDirector.sharedDirector().replaceScene(mainScene)
    }
}