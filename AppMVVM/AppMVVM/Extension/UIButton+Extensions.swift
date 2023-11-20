import UIKit

extension UIButton {
    func tap() {
        simulateEvent(.touchUpInside)
    }
}
