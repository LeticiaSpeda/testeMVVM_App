import UIKit

final class LoginViewController: UIViewController {

    private var loginScreen = LoginSreen()
    private var viewModel: LoginViewModeling

    override func viewDidLoad() {
        super.viewDidLoad()
        loginScreen = LoginSreen()
        view = loginScreen
        loginScreen.delegate = self
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
    func tappedRegisterButton() {
        let viewModel = RegisterViewModel()
        let controller = RegisterViewController(viewModel: viewModel)
        let navigation = UINavigationController(rootViewController: controller)
        navigation.modalPresentationStyle = .fullScreen
        present(navigation, animated: true)
    }
    
    func tappedLoginButton() {
        viewModel.login(email: loginScreen.emailTextField.text ?? "", password: loginScreen.passwordTextField.text ?? "")
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
            print ("Botao desabilitado")
            loginScreen.loginButton.isEnabled = false
            loginScreen.loginButton.backgroundColor = .darkGray.withAlphaComponent(0.6)
        }
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return false
        }
    }
}
