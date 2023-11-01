import UIKit

final class PostCollectionViewCell: UICollectionViewCell, ViewCode {
    static let identifier = String(describing: PostCollectionViewCell.self)
    private let screen = PostCollectionViewCellScreen()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    func configureHierarchy() {
        contentView.addSubview(screen)
    }

    func configureConstraints() {
        screen.pin(view: contentView)
    }

    func setupCell(data: Posts) {  //lista dos posts
        screen.profileImageView.image = UIImage(named: data.profileImage)
        screen.userNameLabel.text = data.userName
        screen.postImageView.image = UIImage(named: data.postImage)
    }

}
