import Foundation

class MainScene: CCNode {
    func didLoadCCB() {
        
        Preloader.LoadAllAudios()
    }
    
    func level1ButtonTapped(sender: AnyObject?) {
        let level = 1
        Navigator.GoToLevel(level)
    }
    
    func level2ButtonTapped(sender: AnyObject?) {
        let level = 2
        Navigator.GoToLevel(level)
    }
    
    func level3ButtonTapped(sender: AnyObject?) {
        let level = 3
        Navigator.GoToLevel(level)
    }
    
    func level4ButtonTapped(sender: AnyObject?) {
        let level = 4
        Navigator.GoToLevel(level)
    }
    
    func level5ButtonTapped(sender: AnyObject?) {
        let level = 5
        Navigator.GoToLevel(level)
    }
}
