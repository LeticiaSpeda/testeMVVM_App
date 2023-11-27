import XCTest
@testable import AppMVVM

final class LoginViewControllerTests: XCTestCase {
    
    func test_whenLoginButton_clickedShouldOnly_calledViewModelOnce() {
        let env = makeEnvironment()

        env.sut.tappedLoginButton()

        XCTAssertEqual(env.viewModel.logginReceiveds.count, 1)
    }

    func test_whenLoginButton_clickedCalls_emptyEmailField() {
        let env = makeEnvironment()

        env.sut.tappedLoginButton()

        XCTAssertEqual(env.viewModel.logginReceiveds.first?.email, "")
    }

    func test_whenLoginButton_clickedCalls_emptyPasswordField() {
        let env = makeEnvironment()

        env.sut.tappedLoginButton()

        XCTAssertEqual(env.viewModel.logginReceiveds.first?.password, "")
    }

    func test_whenLoginButton_clickedCalling_withEmailFieldsFilled() {
        let env = makeEnvironment()

        env.sut.loginScreen.emailTextField.text = "leticia@gmail.com"


        env.sut.tappedLoginButton()


        XCTAssertEqual(env.viewModel.logginReceiveds.first?.email, "leticia@gmail.com" )
    }

    func test_whenLoginButton_clickedCalling_withPasswordFieldsFilled() {
        let env = makeEnvironment()

        env.sut.loginScreen.passwordTextField.text = "leticia"


        env.sut.tappedLoginButton()


        XCTAssertEqual(env.viewModel.logginReceiveds.first?.password, "leticia")
    }


    func test_whenLoginButton_clickedCalling_withEmailAndPasswordFieldsFilled() {
        let env = makeEnvironment()

        env.sut.loginScreen.emailTextField.text = "leticia@gmail.com"
        env.sut.loginScreen.passwordTextField.text = "leticia"


        env.sut.tappedLoginButton()

        XCTAssertEqual(env.viewModel.logginReceiveds.first?.email, "leticia@gmail.com")
        XCTAssertEqual(env.viewModel.logginReceiveds.first?.password, "leticia")
    }
}



private extension LoginViewControllerTests {

    struct Environment {
        let viewModel: LoginViewModelSpy
        let sut: LoginViewController
        let delegate: LoginViewDelegateSpy
    }

    func makeEnvironment() -> Environment {
        let viewModel = LoginViewModelSpy()
        let sut = LoginViewController(viewModel: viewModel)
        let delegate = LoginViewDelegateSpy()

        sut.loadViewIfNeeded()
        return Environment(viewModel: viewModel, sut: sut, delegate: delegate)
    }



    final class LoginViewModelSpy: LoginViewScreenModeling {

        struct Credential {
            let email: String
            let password: String
        }

        private(set) var logginReceiveds = [Credential]()

        var delegate: LoginViewScreenModelDelegate?

        func login(email: String, password: String) {
            logginReceiveds.append(Credential(email: email, password: password))
        }
    }



    final class LoginViewDelegateSpy: LoginViewScreenDelegate {
        private let viewModel = LoginViewModelSpy()
        func tappedLoginButton() {
            viewModel.login(email: String(), password: String())
        }

        func tappedRegisterButton() {}

    }
}


