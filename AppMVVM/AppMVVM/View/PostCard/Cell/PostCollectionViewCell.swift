import UIKit

final class PostCollectionViewCell: UICollectionViewCell, ViewCode {

    static let identifier = String(describing: PostCollectionViewCell.self)

    private var screen = PostCollectionViewScreen()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        screen.configProtocolsCollectionView(delegate: self, dataSource: self)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    func configureHierarchy() {
        contentView.addSubview(screen)
    }

    func configureConstraints() {
        screen.enableViewCode()
        screen.constraints(view: contentView)
    }
}

extension PostCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 450)
    }
}
