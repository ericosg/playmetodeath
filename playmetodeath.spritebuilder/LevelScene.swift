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
    var _level = 0
    var _pointsTxt: CCLabelTTF?
    var _points = Double(0)
    
    let _tpPoints = 100
    let _holdPoints = 10
    
    func addPoints(pointsToAdd: Int) {
        _points += Double(pointsToAdd)
        _pointsTxt?.string = String(format:"%.0f", _points)
    }
    
    func resetPoints() {
        _points = 0
        _pointsTxt?.string = String(format:"%.0f", _points)
    }
    
    override func touchBegan(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        moveHero(touch.locationInNode(self))
        addPoints(_tpPoints)
    }
    
    override func touchMoved(touch: CCTouch!, withEvent event: CCTouchEvent!) {
        moveHero(touch.locationInNode(self))
        addPoints(_holdPoints)
    }
    
    func ccPhysicsCollisionPostSolve(pair: CCPhysicsCollisionPair!, hero nodeA: CCNode!, wildcard nodeB: CCNode!) {
        OALSimpleAudio.sharedInstance().stopAllEffects()
        //CCDirector.sharedDirector().pause()
        //removeHero()
        goToMainScene()
    }
    
    func didLoadFromCCB() {
        resetPoints()
        
        userInteractionEnabled = true
        if let physicsNode = _physicsNode {
            physicsNode.collisionDelegate = self
        }
        
        OALSimpleAudio.sharedInstance().playEffect("Level" + String(_level) + ".caf")
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
        Navigator.GoToLevel(self._level)
    }
}