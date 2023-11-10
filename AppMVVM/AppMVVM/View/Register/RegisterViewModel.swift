import UIKit
import Firebase

protocol RegisterViewModeling {
    func registerUser(email: String, password: String)

    var delegate: RegisterViewModelDelegate? { get set }
}

protocol RegisterViewModelDelegate: AnyObject {
    func sucessRegister()
    func errorRegister(errorMessage: String)
}

final class RegisterViewModel: RegisterViewModeling {
    private var auth = Auth.auth()
    weak var delegate: RegisterViewModelDelegate?

    func registerUser(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { authResult, error in
            if error == nil {
                self.delegate?.sucessRegister()
            } else {
                self.delegate?.errorRegister(errorMessage: error?.localizedDescription ?? "")
            }
        }
    }
}

