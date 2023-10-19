import UIKit

final class HomeScreenView: UIView {
    
    var counter = 0
    
    private lazy var collectionView: UICollectionView = {
        counter += 1
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.showsHorizontalScrollIndicator = false
        collection.backgroundColor = .clear
        collection.register(StoryCardCollectionViewCell.self, forCellWithReuseIdentifier: StoryCardCollectionViewCell.identifier)
        return collection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        
        _ = collectionView
        print(counter)
        _ = collectionView
        print(counter)
        _ = collectionView
        print(counter)
        _ = collectionView
        print(counter)
        _ = collectionView
        print(counter)
        _ = collectionView
        print(counter)
        _ = collectionView
        print(counter)
        _ = collectionView
        print(counter)
    }
    
    private func configureConstrains() {
        //collectionView.constraints(view: self)
        
    }
    
    private func configureStyle() {
//        backgroundColor = .orange
    }
}
