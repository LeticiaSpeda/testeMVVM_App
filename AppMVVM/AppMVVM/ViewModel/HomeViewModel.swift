import UIKit

final class HomeViewModel {
    var getListStory: [Stories] {
        story
    }
    
    var numberOfItems: Int {
        1
    }
    
    private var story = [
        Stories(image: "ïmg1", userName: "Add Story"),
        Stories(image: "ïmg2", userName: "jack"),
        Stories(image: "ïmg3", userName: "carolina"),
        Stories(image: "ïmg4", userName: "samuel"),
        Stories(image: "ïmg5", userName: "ariana josep"),
        Stories(image: "ïmg6", userName: "puggy_101"),
        Stories(image: "ïmg7", userName: "dheeraj_ks")
    ]
    
    func sizeForItem(indexPath: IndexPath, frame: CGRect) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: 120, height: frame.height)
        } else {
            return CGSize(width: frame.width - 120, height: frame.height)
        }
    }
}
