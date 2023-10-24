import UIKit

final class StoryCardCollectionViewScreen: UIView {
    
    private lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.enableViewCode()
        view.setCardShadow()
        return view
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collection.enableViewCode()
        collection.showsVerticalScrollIndicator = false
        collection.backgroundColor = .clear
        collection.contentInset = .init(top: 5, left: 0, bottom: 5, right: 0)
        collection.register(StoryCollectionViewCell.self, forCellWithReuseIdentifier: StoryCollectionViewCell.identifier)
        return collection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) { nil }
    
    func configProtocolsCollectionView(
        delegate: UICollectionViewDelegate,
        dataSource: UICollectionViewDataSource
    ) {
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
    }
    
    private func commonInit() {
        configureHierarchy()
        configureConstraints()
    }
    
    private func configureHierarchy() {
        addSubview(cardView)
        cardView.addSubview(collectionView)
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
        
        collectionView.constraints(view: cardView)
    }
}
