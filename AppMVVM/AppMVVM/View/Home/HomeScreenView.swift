import UIKit

final class HomeScreenView: UIView {
    
    private(set) lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collection.enableViewCode()
        collection.showsHorizontalScrollIndicator = false
        collection.backgroundColor = .clear
        collection.register(
            StoryCardCollectionViewCell.self,
            forCellWithReuseIdentifier: StoryCardCollectionViewCell.identifier
        )
        collection.register(PostCardCollectionViewCell.self, forCellWithReuseIdentifier: PostCardCollectionViewCell.identifier)
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
        configureConstrains()
        configureStyle()
    }
    
    private func configureHierarchy() {
        addSubview(collectionView)
    }
    
    private func configureConstrains() {
        collectionView.pin(view: self)
    }
    
    private func configureStyle() {
        backgroundColor = .appBackGround
    }
}
