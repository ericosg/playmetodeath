import Foundation

class MainScene: CCNode {
    func level1ButtonTapped(sender: AnyObject?) {
        let level = 1
        loadLevel(level)
    }
    
    func level2ButtonTapped(sender: AnyObject?) {
        let level = 2
        loadLevel(level)
    }
    
    func level3ButtonTapped(sender: AnyObject?) {
        let level = 3
        loadLevel(level)
    }
    
    func level4ButtonTapped(sender: AnyObject?) {
        let level = 4
        loadLevel(level)
    }
    
    func level5ButtonTapped(sender: AnyObject?) {
        let level = 5
        loadLevel(level)
    }
    
    func loadLevel(level: Int) {
        if let levelScene = CCBReader.loadAsScene("Level" + String(level) + "Scene") {
            CCDirector.sharedDirector().replaceScene(levelScene)
        }
    }
}
