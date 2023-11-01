import UIKit

final class PostCardCollectionViewCell: UICollectionViewCell, ViewCode {

    static let identifier = String(describing: PostCardCollectionViewCell.self)

    private var screen = PostCollectionViewScreen()
    private var viewModel: PostCardViewModel?

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
        screen.pin(view: contentView)
    }

    func setupCell(listPost: [Posts]) {
        viewModel = PostCardViewModel(listPosts: listPost)
    }
}

extension PostCardCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOffItens ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let viewModel = viewModel else { return UICollectionViewCell()}
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.identifier, for: indexPath) as? PostCollectionViewCell
        cell?.setupCell(data: viewModel.loadCurrentPost(indexPath: indexPath))
        return cell ?? UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 450)
    }
}
