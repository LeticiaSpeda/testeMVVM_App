import UIKit

final class StoryCollectionViewScreen: UIView {
    private lazy var profileImageView: UIImageView = {
        let image = UIImageView(image: .img1)
        
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) { nil }
}
