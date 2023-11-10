import UIKit

protocol TextFieldCustomDelegate: AnyObject {
    func textFieldDidChangeSelection(_ textField: UITextField)
}

final class TextFieldCustom: UIView {

    weak var delegate: TextFieldCustomDelegate?

    var textPlaceholder: String
    var hidePassword: Bool

    var text: String? {
        tfComponent.text
    }

    private lazy var tfComponent: UITextField = {
        let tf = UITextField()
        tf.delegate = self
        tf.placeholder = textPlaceholder
        tf.isSecureTextEntry = hidePassword
        tf.textColor = .gray
        tf.layer.borderWidth = 1
        tf.layer.borderColor = UIColor.gray.cgColor
        tf.layer.cornerRadius = 8
        tf.addLeftPadding()
        return tf
    }()

    init(textPlaceholder: String, hidePassword: Bool) {
        self.textPlaceholder = textPlaceholder
        self.hidePassword = hidePassword
        super.init(frame: .zero)
        configureStyle()
    }

    required init?(coder: NSCoder) { nil }

    private func configureStyle() {
        addSubview(tfComponent)
    }
}

private extension UITextField {
    func addLeftPadding(size: Double = 10) {
        let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: size, height: frame.height))
        leftViewMode = .always
        leftView = leftPaddingView
    }
}

extension TextFieldCustom: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = #colorLiteral(red: 0.2090068758, green: 0.5254446864, blue: 0.9720764756, alpha: 1)
        textField.layer.borderWidth = 1.5
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {
        delegate?.textFieldDidChangeSelection(textField)
    }
}
