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
    var _hero: Hero?
    var _physicsNode: CCPhysicsNode?
    var _level = 0
    var _levelPart = 0
    var _pointsTxt: CCLabelTTF?
    
    let _tpPoints = 10
    let _holdPoints = 1
    
    func addPoints(pointsToAdd: Int) {
        Score.Points += Double(pointsToAdd)
        _pointsTxt?.string = String(format:"%.0f", Score.Points)
    }
    
    func resetPoints() {
        Score.ResetPointsToBank()
        _pointsTxt?.string = String(format:"%.0f", Score.Points)
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
        FailLevel()
    }
    
    func FailLevel() {
        AudioPlayer.Stop()
        //CCDirector.sharedDirector().pause()
        //removeHero()
        restartLevel()
    }
    
    func end(sender: AnyObject?) {
        PassedLevel()
    }
    
    func PassedLevel() {
        Score.Bank()
        if let hero = _hero {
            hero.Store()
        }
        Navigator.GoToLevel(_level + 1)
    }
    
    func didLoadFromCCB() {
        resetPoints()
        if let hero = _hero {
            hero.Restore()
        }
        
        userInteractionEnabled = true
        if let physicsNode = _physicsNode {
            physicsNode.collisionDelegate = self
        }
        
        AudioPlayer.Play(_levelPart)
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
    
    func restartLevel() {
        Navigator.GoToLevel(self._levelPart)
    }
}