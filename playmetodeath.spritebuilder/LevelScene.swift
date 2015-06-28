//
//  MenuScene.swift
//  playmetodeath
//
//  Created by developer on 27/06/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation
class LevelScene : CCNode, CCPhysicsCollisionDelegate, UIAlertViewDelegate
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
    
    func pause() {
        CCDirector.sharedDirector().pause()
        AudioPlayer.Pause()
    }
    
    func resume() {
        CCDirector.sharedDirector().resume()
        AudioPlayer.Resume()
    }
    
    func pauseMenu() {
        pause()
        
        if objc_getClass("UIAlertController") != nil  {
            // use UIAlertController(ios8)
            var refreshAlert = UIAlertController(title: "", message: "Exit to menu?", preferredStyle: UIAlertControllerStyle.Alert)
            
            refreshAlert.addAction(UIAlertAction(title: "Yes", style: .Default, handler: { (action: UIAlertAction!) in
                Navigator.GoToMenu()
            }))
            
            refreshAlert.addAction(UIAlertAction(title: "No", style: .Default, handler: { (action: UIAlertAction!) in
                self.resume()
            }))
            
            CCDirector.sharedDirector().presentViewController(refreshAlert, animated: true, completion: nil)
        } else {
            // use UIAlertView (ios7)
            let alert: UIAlertView = UIAlertView()
            alert.title = ""
            alert.message = "Exit to menu?"
            let yesBut = alert.addButtonWithTitle("Yes")
            let noBut = alert.addButtonWithTitle("No")
            alert.delegate = self
            alert.show()
        }
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        let buttonTitle = alertView.buttonTitleAtIndex(buttonIndex)
        if buttonTitle == "Yes" {
            Navigator.GoToMenu()
        } else {
            resume()
        }
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
        multipleTouchEnabled = true
        enableTripleTouch()
        if let physicsNode = _physicsNode {
            physicsNode.collisionDelegate = self
        }
        
        AudioPlayer.Play(_levelPart)
    }
    
    func enableTripleTouch() {
        let tapGesture = UITapGestureRecognizer(target: self, action: "pauseMenu")
        tapGesture.numberOfTouchesRequired = 3
        CCDirector.sharedDirector().view.addGestureRecognizer(tapGesture)
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