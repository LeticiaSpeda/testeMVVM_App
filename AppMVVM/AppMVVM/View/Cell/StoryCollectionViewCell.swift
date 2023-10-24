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
        screen.enableViewCode()
        screen.constraints(view: contentView)
    }

    func setupCell(data: Stories, indexPatch: IndexPath) {
        screen.profileImageView.image = UIImage(named: data.image)
        screen.userNameLabel.text = data.userName
        screen.adicionarButton.isHidden = indexPatch.row == 0 ? false : true
    }

}
