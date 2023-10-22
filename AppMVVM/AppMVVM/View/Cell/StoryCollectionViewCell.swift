import UIKit

final class StoryCollectionViewCell: UICollectionViewCell {
    static let identifier = String(describing: StoryCollectionViewCell.self)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) { nil }
}
