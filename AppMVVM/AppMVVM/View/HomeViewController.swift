import UIKit

final class HomeViewController: UIViewController {
    
    var homeScreen = HomeScreenView()
    
    override func loadView() {
        super.loadView()
        homeScreen = HomeScreenView()
        view = homeScreen
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}

