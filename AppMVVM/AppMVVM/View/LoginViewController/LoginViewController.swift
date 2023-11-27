import UIKit

class LoginViewController: UIViewController {

    private(set) var loginScreen = LoginViewScreen()
    private var viewModel: LoginViewScreenModeling

    override func viewDidLoad() {
        super.viewDidLoad()
        loginScreen = LoginViewScreen()
        view = loginScreen
        loginScreen.delegate = self
        viewModel.delegate = self
        loginScreen.setupTextFieldDelegate(self)
    }

    init( viewModel: LoginViewScreenModeling) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
}

extension LoginViewController: LoginViewScreenModelDelegate {
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

extension LoginViewController: LoginViewScreenDelegate {
    func tappedRegisterButton() {
        let viewModel = RegisterViewModel()
        let controller = RegisterViewController(viewModel: viewModel)
        let navigation = UINavigationController(rootViewController: controller)
        navigation.modalPresentationStyle = .fullScreen
        present(navigation, animated: true)
    }


    func tappedLoginButton() {
        viewModel.login(
            email: loginScreen.emailTextField.text ?? "",
            password: loginScreen.passwordTextField.text ?? ""
        )
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        let email: String = loginScreen.emailTextField.text ?? ""
        let passwordTextField: String = loginScreen.passwordTextField.text ?? ""
        if !email.isEmpty && !passwordTextField.isEmpty {
            loginScreen.loginButton.isEnabled = true
            loginScreen.loginButton.backgroundColor = .darkGray
        } else {
            loginScreen.loginButton.isEnabled = false
            loginScreen.loginButton.backgroundColor = .darkGray.withAlphaComponent(0.6)
        }
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return false
        }
    }
}
