import UIKit

final class StoryCardCollectionViewCellScreen: UIView {
    
    private lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setCardShadow()
        return view
    }()
    
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
        addSubview(cardView)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(
                equalTo: safeAreaLayoutGuide.topAnchor,
                constant: 15
            ),
            cardView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: 15
            ),
            cardView.trailingAnchor.constraint(
                equalTo: trailingAnchor,
                constant: -10
            ),
            cardView.bottomAnchor.constraint(
                equalTo: safeAreaLayoutGuide.bottomAnchor,
                constant: -15
            ),
        ])
    }
    
}
