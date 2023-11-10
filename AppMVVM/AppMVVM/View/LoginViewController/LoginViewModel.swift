import Foundation
import Firebase

protocol LoginViewModeling {
    func login(email: String, password: String)

    var delegate: LoginViewModelDelegate? { get set }
}

protocol LoginViewModelDelegate: AnyObject {
    func sucessLogin()
    func errorLogin(errorMessage: String)
}

final class LoginViewModel: LoginViewModeling {
    private var auth = Auth.auth()
    weak var delegate: LoginViewModelDelegate?

    func login(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) {  authResult, error in
            if error == nil {
                self.delegate?.sucessLogin()
            } else {
                self.delegate?.errorLogin(errorMessage: error?.localizedDescription ?? "")
            }
        }
    }
}
