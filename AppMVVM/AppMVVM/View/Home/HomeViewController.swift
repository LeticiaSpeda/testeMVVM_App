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
        viewModel.fetchAllRequest()
        homeScreen?.collectionView.reloadData()
    }
}

extension HomeViewController: UICollectionViewDelegate,
                              UICollectionViewDataSource,
                              UICollectionViewDelegateFlowLayout 
{

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {

      return viewModel.numberOfItems
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {

        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCardCollectionViewCell.identifier, for: indexPath) as? StoryCardCollectionViewCell
                cell?.setupCell(listStories: viewModel.getListStory)

            return cell ?? UICollectionViewCell()
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCardCollectionViewCell.identifier, for: indexPath) as? PostCardCollectionViewCell
            cell?.setupCell(listPost: viewModel.getPosts)
            return cell ?? UICollectionViewCell()
        }
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {

        viewModel.sizeForItem(indexPath: indexPath, frame: collectionView.frame)
    }
}

