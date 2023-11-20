import UIKit

protocol RegisterViewScreenProtocol: AnyObject {
    func tappedRegister()
}

final class RegisterViewScreen: UIView, ViewCode {

    weak var delegate: RegisterViewScreenProtocol?

    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Registra-se"
        label.textColor = .white
        label.font = .systemFont(ofSize: 40, weight: .bold)
        return label
    }()

    private(set) lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .white.withAlphaComponent(0.8)
        textField.attributedPlaceholder = NSAttributedString(string: " Digite seu email:", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        textField.keyboardAppearance = .dark
        return textField
    }()

    private(set) lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .white.withAlphaComponent(0.8)
        textField.attributedPlaceholder = NSAttributedString(string: " Digite sua senha:", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])
        textField.isSecureTextEntry = true
        textField.keyboardAppearance = .dark
        return textField
    }()

    private(set) lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Registrar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        button.isEnabled = false
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

    @objc func tappedRegisterButton() {
        delegate?.tappedRegister()
    }

    func setupHierarchy() {
        addSubview(welcomeLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(registerButton)
    }

    func setupActions() {
        registerButton.addTarget(self, action: #selector(handleRegisterButton), for: .touchUpInside)
    }

    func setupConstraints() {
        setupWelcomeConstraints()
        setupEmailTextFieldConstraints()
        setupPasswordTextFieldConstraints()
        setupLoginButtonConstraints()
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
        registerButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(16)
            make.leading.equalTo(safeAreaLayoutGuide.snp.leading).offset(16)
            make.trailing.equalTo(safeAreaLayoutGuide.snp.trailing).inset(16)
            make.height.equalTo(30)
        }
    }

    func setupStyle() {
        backgroundColor = .purple
    }

}
