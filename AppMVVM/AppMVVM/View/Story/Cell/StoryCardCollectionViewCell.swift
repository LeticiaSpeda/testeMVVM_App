import UIKit

final class StoryCardCollectionViewCell: UICollectionViewCell, ViewCode {
    static let identifier = String( describing: StoryCardCollectionViewCell.self)
    
    private var screen = StoryCardCollectionViewScreen()
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


    func setupHierarchy() {
        contentView.addSubview(screen)
    }
    
    func setupConstraints() {
        screen.pin(view: contentView)
    }
}

extension StoryCardCollectionViewCell: UICollectionViewDelegate,
                                       UICollectionViewDataSource,
                                       UICollectionViewDelegateFlowLayout
{

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

        guard let viewModel = viewModel else { return UICollectionViewCell() }

        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.identifier, for: indexPath) as? StoryCollectionViewCell {

            cell.setupCell(data: viewModel.loadCurrentStory(index: indexPath), indexPatch: indexPath)

            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 120)
    }
}
