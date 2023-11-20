import XCTest
@testable import AppMVVM

final class LoginScreenTests: XCTestCase {
    private var sut = LoginSreen()
    private var delegate = LoginScreenMock()

    override func setUp() {
        sut.delegate = delegate
    }

    func test_welcomeLabel_mustPresentTextBemVindo() {
        XCTAssertEqual(sut.welcomeLabel.text, "Bem Vindo!")
    }

    func test_welcomeLabel_mustPresentTextColorWhite() {
        XCTAssertEqual(sut.welcomeLabel.textColor, .white)
    }

    func test_welcomeLabel_mustPresentFontOfSize40AndBold() {
        XCTAssertEqual(sut.welcomeLabel.font, .systemFont(ofSize: 40, weight: .bold))
    }

    func test_emailTextField_mustPresentPlacehlderDigiteSeuEmail() {

        let attributed = NSAttributedString(string: "Digite seu email:", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])

        let emailTextField = sut.emailTextField
        XCTAssertEqual(emailTextField.attributedPlaceholder, attributed)
    }

    func test_emailTextField_mustPresentKeyboardAppearanceDark() {
        XCTAssertEqual(sut.emailTextField.keyboardAppearance, .dark)
    }

    func test_emailTextField_mustPresentCornerRadius10() {
        XCTAssertEqual(sut.emailTextField.layer.cornerRadius, 10)
    }

    func test_emailTextField_mustPresentBackgroundColorWhite_withAlphaComponent08() {
        XCTAssertEqual(sut.emailTextField.backgroundColor, .white.withAlphaComponent(0.8))
    }

    func test_passwordTextField_mustPresentPlacehlderDigite() {
        let atrributed = NSAttributedString(string: "Digite sua senha:", attributes: [NSAttributedString.Key.foregroundColor : UIColor.gray])

        XCTAssertEqual(sut.passwordTextField.attributedPlaceholder, atrributed)
    }

    func test_passwordTextField_mustPresentKeyboardAppearanceDark() {
        XCTAssertEqual(sut.passwordTextField.keyboardAppearance, .dark)
    }

    func test_passwordTextField_mustPresentCornerRadius10() {
        XCTAssertEqual(sut.passwordTextField.layer.cornerRadius, 10)
    }

    func test_passwordTextField_mustPresentBackgroundColorWhite_withAlphaComponent08() {
        XCTAssertEqual(sut.passwordTextField.backgroundColor, .white.withAlphaComponent(0.8))
    }


    func test_passwordTextField_mustHidePasswordCharacters() {
        XCTAssertTrue(sut.passwordTextField.isSecureTextEntry)
    }

    func test_loginButton_mustPresentTitleLabelLogin() {
        XCTAssertEqual(sut.loginButton.titleLabel?.text, "Login")
    }

    func test_loginButton_mustPresentTitleColorWhite() {
        XCTAssertEqual(sut.loginButton.titleLabel?.textColor, .white )
    }

    func test_loginButton_mustPresentBackgroundColorMagentaWithAlpha03() {
        XCTAssertEqual(sut.loginButton.backgroundColor, .magenta.withAlphaComponent(0.6)  )
    }

    func test_loginButton_mustPresentCornerRadius10() {
        XCTAssertEqual(sut.loginButton.layer.cornerRadius, 10  )
    }

    func test_loginButton_mustPresentBackgroundColorMagetaWithAlphaComponent() {
        XCTAssertEqual(sut.backgroundColor, .magenta.withAlphaComponent(0.6))
    }

    func test_registerButton_mustActivatedOnce() {
        sut.tappedLogin()

        XCTAssertEqual(delegate.tappedLoginButtonCallCount, 1)
    }

    func test_registerButton_mustPresentTitleLabelLogin() {
        XCTAssertEqual(sut.registerButton.titleLabel?.text, "Registre-se")
    }

    func test_registerButton_mustPresentTitleColorWhite() {
        XCTAssertEqual(sut.registerButton.titleLabel?.textColor, .white )
    }

    func test_registerButton_mustPresentBackgroundColorMagentaWithAlpha03() {
        XCTAssertEqual(sut.registerButton.backgroundColor, .magenta.withAlphaComponent(0.3)  )
    }

    func test_registerButton_mustPresentCornerRadius10() {
        XCTAssertEqual(sut.registerButton.layer.cornerRadius, 10 )
    }

    func test_() {
        sut.tappedRegister()

        XCTAssertEqual(delegate.tappedRegisterButtonCallCount, 1)
    }

}

extension LoginScreenTests {

    final class LoginScreenMock: LoginScreenDelegate {
        private(set) var tappedLoginButtonCallCount = 0
        private(set) var tappedRegisterButtonCallCount = 0

        func tappedLoginButton() {
            tappedLoginButtonCallCount += 1
        }
        
        func tappedRegisterButton() {
            tappedRegisterButtonCallCount += 1
        }
    }
}

extension LoginSreen {
    func tappedLogin() {
        loginButton.tap()
    }

    func tappedRegister() {
        registerButton.tap()
    }
}
