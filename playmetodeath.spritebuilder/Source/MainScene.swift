import Foundation

class MainScene: CCNode {
    func playButtonTapped(sender: AnyObject?) {
        
        let menuScene = CCBReader.loadAsScene("MenuScene")
        CCDirector.sharedDirector().replaceScene(menuScene)
    }
}
