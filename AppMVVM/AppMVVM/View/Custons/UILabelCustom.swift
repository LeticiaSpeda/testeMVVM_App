import UIKit

final class UILabelCustom: UILabel {

    var title: String

    init(title: String) {
        self.title = title
        super.init(frame: .zero)
        configureStyle()
    }

    required init?(coder: NSCoder) { nil }

    private func configureStyle() {
        textColor = .black
        font = UIFont.systemFont(ofSize: 16, weight: .bold)
        text = title
        translatesAutoresizingMaskIntoConstraints = false
    }
}
