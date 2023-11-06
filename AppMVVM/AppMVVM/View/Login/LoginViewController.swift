import UIKit

final class LoginViewController: UIViewController, LoginScreenProtocol {

    private var screen = LoginSreen()

    override func viewDidLoad() {
        super.viewDidLoad()
        screen = LoginSreen()
        view = screen
        screen.delegate = self
    }

    func tappedLoginButton() {
        let controller = HomeViewController()
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true)
    }

}
