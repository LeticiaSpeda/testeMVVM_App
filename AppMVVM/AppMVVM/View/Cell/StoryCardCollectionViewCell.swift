import UIKit

final class StoryCardCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: StoryCardCollectionViewCell.self)
    
    private var screen = StoryCardCollectionViewCellScreen()
    private var viewModel: StoryCardViewModel?
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        screen.configProtocolsCollectionView(
            delegate: self,
            dataSource: self
        )
        commonInit()
    }
    
    required init?(coder: NSCoder) { nil }
    
    func setupCell(listStories: [Stories]) {
        viewModel = StoryCardViewModel(listStory: listStories)
    }
    
    private func commonInit() {
        configureHierarchy()
        configureConstraints()
    }
    
    private func configureHierarchy() {
        contentView.addSubview(screen)
    }
    
    private func configureConstraints() {
        screen.translatesAutoresizingMaskIntoConstraints = false
        screen.constraints(view: contentView)
    }
}

extension StoryCardCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        
        return viewModel?.numberOfItens ?? 0
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 120)
    }
}
