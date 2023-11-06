import UIKit

final class PostCollectionViewScreen: UIView, ViewCode {

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
        collection.register(PostCollectionViewCell.self, forCellWithReuseIdentifier: PostCollectionViewCell.identifier)
        return collection
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    func configProtocolsCollectionView(
        delegate: UICollectionViewDelegate,
        dataSource: UICollectionViewDataSource
    ) {
        collectionView.delegate = delegate
        collectionView.dataSource = dataSource
    }
    func setupHierarchy() {
        addSubview(collectionView)

    }

    func setupConstraints() {
        collectionView.pin(view: self)
    }


}
