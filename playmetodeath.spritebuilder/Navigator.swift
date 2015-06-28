//
//  Navigator.swift
//  playmetodeath
//
//  Created by developer on 27/06/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation
class Navigator {
    class func GoToLevel(level: Int) {
        if let levelScene = CCBReader.loadAsScene("Level" + String(level) + "Scene") {
            CCDirector.sharedDirector().replaceScene(levelScene)
        }
    }
    
    class func GoToMenu() {
        if let mainScene = CCBReader.loadAsScene("MainScene") {
            AudioPlayer.Stop()
            CCDirector.sharedDirector().replaceScene(mainScene)
        }
    }
}