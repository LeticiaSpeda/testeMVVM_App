import UIKit

final class StoryCollectionViewScreen: UIView, ViewCode {

    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage())
        imageView.enableViewCode()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 40
        imageView.clipsToBounds = true
        return imageView
    }()

    lazy var borderView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1.5
        view.layer.borderColor = #colorLiteral(red: 0.968627451, green: 0.262745098, blue: 0.6156862745, alpha: 1)
        view.layer.cornerRadius = 40
        view.enableViewCode()
        return view
    }()

    lazy var adicionarButton: UIButton = {
        let button = UIButton()
        button.enableViewCode()
        button.setBackgroundImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        button.imageView?.tintColor = .blue
        button.backgroundColor = .white
        button.layer.cornerRadius = 12.5
        return button
    }()
    
    lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 12, weight: .semibold)
        label.enableViewCode()
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    @available(*,unavailable)
    required init?(coder: NSCoder) { nil }
    
    func configureHierachy() {
        addSubview(borderView)
        profileImageView.addSubview(borderView)
        addSubview(profileImageView)
        addSubview(adicionarButton)
        addSubview(userNameLabel)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([
            profileImageView.widthAnchor.constraint(
                equalToConstant: 80
            ),
            profileImageView.heightAnchor.constraint(
                equalToConstant: 80
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
                equalTo: profileImageView.leadingAnchor
            ),
            userNameLabel.trailingAnchor.constraint(
                equalTo: profileImageView.trailingAnchor
            ),

            borderView.widthAnchor.constraint(equalToConstant: 80),
            borderView.heightAnchor.constraint(equalToConstant: 80),
            borderView.centerXAnchor.constraint(equalTo: profileImageView.centerXAnchor),
            borderView.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor)
        ])
    }
}
