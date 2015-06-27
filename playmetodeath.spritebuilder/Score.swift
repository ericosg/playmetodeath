//
//  Score.swift
//  playmetodeath
//
//  Created by developer on 27/06/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

import Foundation
class Score {
    static var Points: Double {
        get {
            return points
        }
        set (value) {
            points = value
            maxPoints = points > maxPoints ? points : maxPoints
        }
    }
    static var MaxPoints: Double {
        get {
            return maxPoints;
        }
    }
    static var BankedPoints: Double = 0
    
    private static var maxPoints:Double = 0
    private static var points:Double = 0
    
    class func ResetPointsToBank() {
        Points = BankedPoints
    }
    
    class func Bank() {
        BankedPoints = Points
    }
}