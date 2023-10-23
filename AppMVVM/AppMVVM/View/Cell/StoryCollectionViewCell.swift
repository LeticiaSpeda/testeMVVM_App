import UIKit

final class StoryCollectionViewCell: UICollectionViewCell, ViewCode {
    static let identifier = String(describing: StoryCollectionViewCell.self)

    private var screen = StoryCollectionViewScreen()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) { nil }

    func configureHierachy() {
        contentView.addSubview(screen)
    }

    func configureConstraints() {
        screen.translate()
        screen.constraints(view: contentView)
    }

}
