import UIKit

final class HomeScreenView: UIView {
    
    private var collection: UICollectionView {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let colletction = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        colletction.translatesAutoresizingMaskIntoConstraints = false
        colletction.showsHorizontalScrollIndicator = false
        colletction.register(HomeCollectionCell.self, forCellWithReuseIdentifier: HomeCollectionCell.identifier)
        colletction.backgroundColor = .clear
        colletction.dataSource = self
        colletction.delegate = self
        return colletction
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        configureHierarchy()
        configureConstrains()
        configureStyle()
    }
    
    private func configureHierarchy() {
        addSubview(collection)
    }
    
    private func configureConstrains() {
        collection.constraints(view: self)
    }
    
    private func configureStyle() {
        backgroundColor = .orange
    }
    
}

extension HomeScreenView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
