import UIKit

extension UIControl {

    func simulateEvent(_ event: UIControl.Event) {
        guard isEnabled && isUserInteractionEnabled else {
            return
        }

        for target in allTargets {
            let target = target as NSObjectProtocol
            for actionName in actions(forTarget: target, forControlEvent: event) ?? [] {
                let selector = Selector(actionName)
                target.perform(selector)
            }
        }
    }
}
