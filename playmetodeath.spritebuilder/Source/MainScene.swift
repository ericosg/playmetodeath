import Foundation

class MainScene: CCNode {
    func playButtonTapped(sender: AnyObject?) {
        
        let levelScene = CCBReader.loadAsScene("LevelScene")
        CCDirector.sharedDirector().replaceScene(levelScene)
    }
}
