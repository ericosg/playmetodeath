//
//  Preloader.swift
//  playmetodeath
//
//  Created by developer on 27/06/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation
class Preloader
{
    class func LoadAllAudios() {
        OALSimpleAudio.sharedInstance().preloadEffect("Level1.caf")
    }
}