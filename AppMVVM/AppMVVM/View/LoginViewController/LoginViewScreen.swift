import UIKit
import SnapKit

protocol LoginViewScreenDelegate: AnyObject {
    func tappedLoginButton()
    func tappedRegisterButton()
}

final class LoginViewScreen: UIView, ViewCode {

    weak var delegate: LoginViewScreenDelegate?

    private(set) lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Bem Vindo!"
        label.textColor = .white
        label.font = .systemFont(ofSize: 40, weight: .bold)
        return label
    }()

    private(set) lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .white.withAlphaComponent(0.8)
        textField.attributedPlaceholder = NSAttributedString(string: "Digite seu email:", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        textField.keyboardAppearance = .dark
        return textField
    }()

    private(set) lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .white.withAlphaComponent(0.8)
        textField.attributedPlaceholder = NSAttributedString(string: "Digite sua senha:", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        textField.isSecureTextEntry = true
        textField.keyboardAppearance = .dark
        return textField
    }()

    private(set) lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .magenta.withAlphaComponent(0.6)
        button.layer.cornerRadius = 10
        return button
    }()

    private(set) lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Registre-se", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .magenta.withAlphaComponent(0.3)
        button.layer.cornerRadius = 10
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func handleLoginButton() {
        delegate?.tappedLoginButton()
    }

    @objc private func handleRegisterButton() {
        delegate?.tappedRegisterButton()
    }

    func setupActions() {
        loginButton.addTarget(
            self,
            action: #selector(handleLoginButton),
            for: .touchUpInside
        )
        registerButton.addTarget(
            self,
            action: #selector(handleRegisterButton),
            for: .touchUpInside
        )
    }

    func setupHierarchy() {
        addSubview(welcomeLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        addSubview(registerButton)
    }

    func setupConstraints() {
        setupWelcomeConstraints()
        setupEmailTextFieldConstraints()
        setupPasswordTextFieldConstraints()
        setupLoginButtonConstraints()
        setupRegisterButtonConstraints()
    }

    private func setupWelcomeConstraints() {
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(16)
            make.centerX.equalTo(snp.centerX)
        }
    }

    private func setupEmailTextFieldConstraints() {
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel.snp.bottom).offset(20)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(16)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).inset(16)
            make.height.equalTo(30)
        }
    }

    private func setupPasswordTextFieldConstraints() {
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(16)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(16)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).inset(16)
            make.height.equalTo(30)
        }
    }

    private func setupLoginButtonConstraints() {
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(16)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(16)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).inset(16)
            make.height.equalTo(30)
        }
    }

    private func setupRegisterButtonConstraints() {
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(16)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(16)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).inset(16)
            make.height.equalTo(30)
        }
    }

    func setupStyle() {
        backgroundColor = .magenta.withAlphaComponent(0.6)
    }

    func setupTextFieldDelegate(_ delegate: UITextFieldDelegate) {
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
}


