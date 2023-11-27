import XCTest
@testable import AppMVVM

final class LoginScreenTests: XCTestCase {

    func test_welcomeLabel_mustPresentTextBemVindo() {
        let env = makeEnviroment()
        XCTAssertEqual(env.loginView.welcomeLabel.text, "Bem Vindo!")
    }

    func test_welcomeLabel_mustPresentTextColorWhite() {
        let env = makeEnviroment()
        XCTAssertEqual(env.loginView.welcomeLabel.textColor, .white)
    }

    func test_welcomeLabel_mustPresentFontOfSize40AndBold() {
        let env = makeEnviroment()
        XCTAssertEqual(env.loginView.welcomeLabel.font, .systemFont(ofSize: 40, weight: .bold))
    }

    func test_emailTextField_mustPresentPlacehlderDigiteSeuEmail() {
        let env = makeEnviroment()
        let attributed = NSAttributedString(string: "Digite seu email:", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])

        let emailTextField = env.loginView.emailTextField
        XCTAssertEqual(emailTextField.attributedPlaceholder, attributed)
    }

    func test_emailTextField_mustPresentKeyboardAppearanceDark() {
        let env = makeEnviroment()
        XCTAssertEqual(env.loginView.emailTextField.keyboardAppearance, .dark)
    }

    func test_emailTextField_mustPresentCornerRadius10() {
        let env = makeEnviroment()
        XCTAssertEqual(env.loginView.emailTextField.layer.cornerRadius, 10)
    }

    func test_emailTextField_mustPresentBackgroundColorWhite_withAlphaComponent08() {
        let env = makeEnviroment()
        XCTAssertEqual(env.loginView.emailTextField.backgroundColor, .white.withAlphaComponent(0.8))
    }

    func test_passwordTextField_mustPresentPlacehlderDigite() {
        let env = makeEnviroment()
        let atrributed = NSAttributedString(string: "Digite sua senha:", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])

        XCTAssertEqual(env.loginView.passwordTextField.attributedPlaceholder, atrributed)
    }

    func test_passwordTextField_mustPresentKeyboardAppearanceDark() {
        let env = makeEnviroment()
        XCTAssertEqual(env.loginView.passwordTextField.keyboardAppearance, .dark)
    }

    func test_passwordTextField_mustPresentCornerRadius10() {
        let env = makeEnviroment()
        XCTAssertEqual(env.loginView.passwordTextField.layer.cornerRadius, 10)
    }

    func test_passwordTextField_mustPresentBackgroundColorWhite_withAlphaComponent08() {
        let env = makeEnviroment()
        XCTAssertEqual(env.loginView.passwordTextField.backgroundColor, .white.withAlphaComponent(0.8))
    }


    func test_passwordTextField_mustHidePasswordCharacters() {
        let env = makeEnviroment()
        XCTAssertTrue(env.loginView.passwordTextField.isSecureTextEntry)
    }

    func test_loginButton_mustPresentTitleLabelLogin() {
        let env = makeEnviroment()
        XCTAssertEqual(env.loginView.loginButton.titleLabel?.text, "Login")
    }

    func test_loginButton_mustPresentTitleColorWhite() {
        let env = makeEnviroment()
        XCTAssertEqual(env.loginView.loginButton.titleLabel?.textColor, .white )
    }

    func test_loginButton_mustPresentBackgroundColorMagentaWithAlpha03() {
        let env = makeEnviroment()
        XCTAssertEqual(env.loginView.loginButton.backgroundColor, .magenta.withAlphaComponent(0.6)  )
    }

    func test_loginButton_mustPresentCornerRadius10() {
        let env = makeEnviroment()
        XCTAssertEqual(env.loginView.loginButton.layer.cornerRadius, 10  )
    }

    func test_loginButton_mustPresentBackgroundColorMagetaWithAlphaComponent() {
        let env = makeEnviroment()
        XCTAssertEqual(env.loginView.backgroundColor, .magenta.withAlphaComponent(0.6))
    }

    func test_loginButton_mustActivatedOnce() {
        let env = makeEnviroment()
        env.loginView.tappedLogin()

        XCTAssertEqual(env.delegate.tappedLoginButtonCallCount, 1)
    }

    func test_registerButton_mustPresentTitleLabelLogin() {
        let env = makeEnviroment()
        XCTAssertEqual(env.loginView.registerButton.titleLabel?.text, "Registre-se")
    }

    func test_registerButton_mustPresentTitleColorWhite() {
        let env = makeEnviroment()
        XCTAssertEqual(env.loginView.registerButton.titleLabel?.textColor, .white )
    }

    func test_registerButton_mustPresentBackgroundColorMagentaWithAlpha03() {
        let env = makeEnviroment()
        XCTAssertEqual(env.loginView.registerButton.backgroundColor, .magenta.withAlphaComponent(0.3)  )
    }

    func test_registerButton_mustPresentCornerRadius10() {
        let env = makeEnviroment()
        XCTAssertEqual(env.loginView.registerButton.layer.cornerRadius, 10 )
    }

    func test_registerButton_mustActivatedOnce() {
        let env = makeEnviroment()
        env.loginView.tappedRegister()

        XCTAssertEqual(env.delegate.tappedRegisterButtonCallCount, 1)
    }

}

private extension LoginScreenTests {

    final class LoginScreenSpy: LoginViewScreenDelegate {
        private(set) var tappedLoginButtonCallCount = 0
        private(set) var tappedRegisterButtonCallCount = 0

        func tappedLoginButton() {
            tappedLoginButtonCallCount += 1
        }

        func tappedRegisterButton() {
            tappedRegisterButtonCallCount += 1
        }
    }

    struct Enviroment {
        let loginView: LoginViewScreen
        let delegate: LoginScreenSpy
    }

    func makeEnviroment() -> Enviroment {
        let loginView = LoginViewScreen()
        let delegate = LoginScreenSpy()

        loginView.delegate = delegate

        return Enviroment(loginView: loginView, delegate: delegate)
    }
}

private extension LoginViewScreen {
    func tappedLogin() {
        loginButton.tap()
    }

    func tappedRegister() {
        registerButton.tap()
    }
}
