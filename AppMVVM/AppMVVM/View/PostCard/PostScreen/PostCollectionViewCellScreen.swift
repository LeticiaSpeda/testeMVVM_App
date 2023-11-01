import UIKit

final class PostCollectionViewCellScreen: UIView, ViewCode {

    private lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.setCardShadow()
        view.enableViewCode()
        view.layer.cornerRadius = 15
        view.clipsToBounds = true
        return view
    }()


    private lazy var likeImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage.likeselected)
        imageView.contentMode = .scaleAspectFit
        imageView.enableViewCode()
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedLikeImageView))
        tap.numberOfTapsRequired = 1 // apenas com um click
        imageView.addGestureRecognizer(tap) // gesto de toque
        imageView.isUserInteractionEnabled = true // a imagem possui interacao
        imageView.isHidden = false
        return imageView
    }()

    private(set) lazy var profileImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "demo"))
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 15
        imageView.enableViewCode()
        return imageView
    }()

    private(set) lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.enableViewCode()
        return label
    }()

    private(set) lazy var postImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage.post1)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 15
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedPostImageView))
        tap.numberOfTapsRequired = 1 // apenas com um click
        imageView.addGestureRecognizer(tap) // gesto de toque
        imageView.isUserInteractionEnabled = true // a imagem possui interacao
        imageView.enableViewCode()
        return imageView
    }()

    private lazy var heartImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage.whiteheart)
        imageView.contentMode = .scaleAspectFill
        imageView.enableViewCode()
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    @available(*,unavailable)
    required init?(coder: NSCoder) { nil }

    @objc func tappedPostImageView() {

    }

    @objc func tappedLikeImageView() {

    }

    func configureHierarchy() {
        addSubview(cardView)

        cardView.addSubview(likeImageView)
        cardView.addSubview(profileImageView)
        cardView.addSubview(userNameLabel)
        cardView.addSubview(postImageView)
        cardView.addSubview(heartImageView)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor,
                constant: 15
            ),
            cardView.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 10
            ),
            cardView.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -15
            ),
            cardView.bottomAnchor.constraint(
                equalTo: safeAreaLayoutGuide.bottomAnchor,
                constant: -10
            ),

            likeImageView.topAnchor.constraint(
                equalTo: cardView.topAnchor,
                constant: 20
            ),
            likeImageView.trailingAnchor.constraint(
                equalTo: cardView.trailingAnchor,
                constant: -20
            ),
            likeImageView.heightAnchor.constraint(equalToConstant: 25),
            likeImageView.widthAnchor.constraint(equalToConstant: 25),

            profileImageView.topAnchor.constraint(
                equalTo: cardView.topAnchor,
                constant: 18
            ),
            profileImageView.leadingAnchor.constraint(
                equalTo: cardView.leadingAnchor,
                constant: 20
            ),
            profileImageView.heightAnchor.constraint(equalToConstant: 30),
            profileImageView.widthAnchor.constraint(equalToConstant: 30),

            userNameLabel.topAnchor.constraint(
                equalTo: cardView.topAnchor,
                constant: 24
            ),
            userNameLabel.leadingAnchor.constraint(
                equalTo: profileImageView.trailingAnchor,
                constant: 10
            ),

            postImageView.topAnchor.constraint(
                equalTo: profileImageView.bottomAnchor,
                constant: 18
            ),
            postImageView.leadingAnchor.constraint(
                equalTo: cardView.leadingAnchor,
                constant: 8
            ),
            postImageView.trailingAnchor.constraint(
                equalTo: cardView.trailingAnchor,
                constant: -8
            ),
            postImageView.bottomAnchor.constraint(
                equalTo: cardView.bottomAnchor,
                constant: -8
            ),

            heartImageView.centerXAnchor.constraint(
                equalTo: postImageView.centerXAnchor
            ),
            heartImageView.centerYAnchor.constraint(
                equalTo: postImageView.centerYAnchor
            ),
            heartImageView.heightAnchor.constraint(equalToConstant: 70),
            heartImageView.widthAnchor.constraint(equalToConstant: 70)
        ])
    }
}
