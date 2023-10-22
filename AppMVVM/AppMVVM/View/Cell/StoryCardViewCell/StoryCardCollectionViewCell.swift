import UIKit

final class StoryCardCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: StoryCardCollectionViewCell.self)
    
    private var screen = StoryCardCollectionViewCellScreen()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) { nil }
    
    private func commonInit() {
        configureHierarchy()
        configureConstraints()
    }
    
    private func configureHierarchy() {
        contentView.addSubview(screen)
    }
    
    private func configureConstraints() {
        screen.translatesAutoresizingMaskIntoConstraints = false
        screen.constraints(view: contentView)
    }
}
