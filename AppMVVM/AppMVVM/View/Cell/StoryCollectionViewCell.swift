import UIKit

final class StoryCollectionViewCell: UICollectionViewCell, ViewCode {

    static let identifier = String(describing: StoryCollectionViewCell.self)

    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translate()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 35
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var adicionarButton: UIButton = {
        let button = UIButton()
        button.translate()
        button.setBackgroundImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        button.imageView?.tintColor = .blue
        button.backgroundColor = .white
        button.layer.cornerRadius = 12.5
        return button
    }()

    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.translate()
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) { nil }

    func configureHierachy() {
        addSubview(profileImageView)
        addSubview(adicionarButton)
        addSubview(userNameLabel)
    }

    func configureConstraints() {
        NSLayoutConstraint.activate([
            profileImageView.widthAnchor.constraint(
                equalToConstant: 70
            ),
            profileImageView.heightAnchor.constraint(
                equalToConstant: 70
            ),
            profileImageView.centerXAnchor.constraint(
                equalTo: centerXAnchor
            ),
            profileImageView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: 15
            ),

            adicionarButton.widthAnchor.constraint(
                equalToConstant: 25
            ),

            adicionarButton.heightAnchor.constraint(
                equalToConstant: 25
            ),
            adicionarButton.trailingAnchor.constraint(
                equalTo: profileImageView.trailingAnchor
            ),
            adicionarButton.bottomAnchor.constraint(
                equalTo: profileImageView.bottomAnchor
            ),

            userNameLabel.topAnchor.constraint(
                equalTo: profileImageView.bottomAnchor,
                constant: 10
            ),
            userNameLabel.leadingAnchor.constraint(
                equalTo: profileImageView.leadingAnchor,
                constant: 10
            ),
            userNameLabel.trailingAnchor.constraint(
                equalTo: profileImageView.trailingAnchor,
                constant: -10
            ),
        ])
    }
}
