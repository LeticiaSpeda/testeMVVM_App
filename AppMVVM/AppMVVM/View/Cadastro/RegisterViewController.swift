import UIKit

final class RegisterViewController: UIViewController {

    private var screen = RegisterViewScreen()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        screen = RegisterViewScreen()
        view = screen
    }

    @objc func handleCancel() {
        dismiss(animated: true)
    }

    func setupNavigationBar() {
        navigationController?.navigationBar.tintColor = .white
        navigationItem.rightBarButtonItem = .init(
            image: UIImage(systemName: "xmark"),
            style: .done,
            target: self,
            action: #selector(handleCancel)
        )
    }
}


