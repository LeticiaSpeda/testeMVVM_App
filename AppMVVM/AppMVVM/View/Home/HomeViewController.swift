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

        viewModel.fetchAllRequest()
        viewModel.delegate = self
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

extension HomeViewController: HomeViewModelProtocol {
    func success() {
        DispatchQueue.main.async {
            self.homeScreen?.configProtocolsCollectionView(
                delegate: self,
                dataSource: self
            )
        }
    }
    
    func error() {
        let alert = UIAlertController(title: "Error!", message: "o login falhou", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .destructive))
        present(alert, animated: true)
    }
}
