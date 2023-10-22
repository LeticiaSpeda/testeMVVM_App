import UIKit

final class RetainCycleController: UIViewController {
    private var name = "Paolo"
    override func viewDidLoad() {
        Firebase.track(event: "click") {
            self.name = "Leticia"
        }
        view.backgroundColor = .red
    }
}

final class Firebase {
    static func track(event: String, callback: () -> Void) {
        print("Tageando evento \(event)")
        callback()
    }
}
