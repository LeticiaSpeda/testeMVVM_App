import Foundation
import Firebase

protocol LoginViewScreenModeling {
    func login(email: String, password: String)

    var delegate: LoginViewScreenModelDelegate? { get set }
}

protocol LoginViewScreenModelDelegate: AnyObject {
    func sucessLogin()
    func errorLogin(errorMessage: String)
}

final class LoginViewModel: LoginViewScreenModeling {

    private var auth = Auth.auth()
    weak var delegate: LoginViewScreenModelDelegate?

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



