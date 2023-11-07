import UIKit

final class LoginViewController: UIViewController {

    private var screen = LoginSreen()
    private var viewModel: LoginViewModeling


    override func viewDidLoad() {
        super.viewDidLoad()
        screen = LoginSreen()
        view = screen
        screen.delegate = self
        viewModel.delegate = self
    }

    init( viewModel: LoginViewModeling) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }


}

extension LoginViewController: LoginViewModelDelegate {
    func sucessLogin() {
        let controller = HomeViewController()
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true)
    }

    func errorLogin(errorMessage: String) {
        let alert = UIAlertController(title: "Error!", message: "falha no login", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .destructive))
        present(alert, animated: true)
    }
}

extension LoginViewController: LoginScreenProtocol {
    func tappedLoginButton() {
        viewModel.login(email: screen.emailTextField.text ?? "", password: screen.passwordTextField.text ?? "")
    }
}
