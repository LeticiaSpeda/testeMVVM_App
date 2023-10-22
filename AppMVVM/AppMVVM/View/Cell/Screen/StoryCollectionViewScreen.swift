import UIKit

final class StoryCollectionViewScreen: UIView {
    
    var screen = StoryCollectionViewCell()
    
    private lazy var profileImageView: UIImageView = {
        let image = UIImageView(image: .img1)
        
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        screen = StoryCollectionViewCell()
    }
    
    required init?(coder: NSCoder) { nil }
}
