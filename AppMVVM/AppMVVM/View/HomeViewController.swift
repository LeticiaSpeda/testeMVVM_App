import UIKit

final class HomeViewController: UIViewController {
    
    private var homeScreen: HomeScreenView?
    private var viewModel = HomeViewModel()
    
    override func loadView() {
        super.loadView()
        homeScreen = HomeScreenView()
        view = homeScreen
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        homeScreen?.configProtocolsCollectionView(
            delegate: self,
            dataSource: self
        )
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        
        viewModel.numberOfItems
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCardCollectionViewCell.identifier, for: indexPath)
        
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        
        viewModel.sizeForItem(indexPath: indexPath, frame: collectionView.frame)
    }
}

