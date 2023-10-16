import UIKit

final class HomeViewModel {
    
    var numberOfItems: Int {
        2
    }
    
    func sizeForItem(indexPath: IndexPath, frame: CGRect) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: 120, height: frame.height)
        } else {
            return CGSize(width: frame.width, height: frame.height)
        }
    }
}
