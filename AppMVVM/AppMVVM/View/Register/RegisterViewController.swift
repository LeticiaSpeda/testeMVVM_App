import UIKit

final class RegisterViewController: UIViewController {

    private var registerScreen = RegisterViewScreen()
    private var viewModel: RegisterViewModeling

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        registerScreen.delegate = self
        registerScreen.emailTextField.delegate = self
        registerScreen.passwordTextField.delegate = self
        viewModel.delegate = self
    }

    override func loadView() {
        super.loadView()
        view = registerScreen
    }

    init(viewModel: RegisterViewModeling) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }

    @objc func handleCancel() {
        dismiss(animated: true)
    }

    func setupNavigationBar() {
        navigationItem.rightBarButtonItem = .init(
            image: UIImage(systemName: "xmark")?.withTintColor(.white, renderingMode: .alwaysOriginal),
            style: .done,
            target: self,
            action: #selector(handleCancel)
        )
        navigationController?.navigationBar.tintColor = .white
    }
}

extension RegisterViewController: RegisterViewModelDelegate {
    func sucessRegister() {
        let controller = HomeViewController()
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true)
    }
    
    func errorRegister(errorMessage: String) {
        let alert = UIAlertController(title: "Error!", message: "falha no login", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .destructive))
        present(alert, animated: true)
    }
}

extension RegisterViewController: RegisterViewScreenProtocol {
    func tappedRegister() {
        viewModel.registerUser(email: registerScreen.emailTextField.text ?? "", password: registerScreen.passwordTextField.text ?? "" )
    }
}

extension RegisterViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {

        let email = registerScreen.emailTextField.text ?? ""
        let passwordTextField = registerScreen.passwordTextField.text ?? ""
                   
        if !email.isEmpty && !passwordTextField.isEmpty {
            registerScreen.registerButton.isEnabled = true
            registerScreen.registerButton.backgroundColor = .magenta.withAlphaComponent(0.6)
        } else {
            registerScreen.registerButton.isEnabled = false
            registerScreen.registerButton.backgroundColor = .gray
        }

        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return false
        }
    }
}
