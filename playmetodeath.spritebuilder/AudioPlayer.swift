//
//  AudioPlayer.swift
//  playmetodeath
//
//  Created by developer on 28/06/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation
class AudioPlayer {
    private static var currentlyPlaying: Int = 0
    
    class func Play(levelPart: Int) {
        if levelPart != AudioPlayer.currentlyPlaying {
            OALSimpleAudio.sharedInstance().playEffect("Level" + String(levelPart) + ".caf")
        }
        
        currentlyPlaying = levelPart
    }
    
    class func Stop() {
        OALSimpleAudio.sharedInstance().stopAllEffects()
        AudioPlayer.currentlyPlaying = 0
    }
}
