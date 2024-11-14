import UIKit
import Home

public class ViewController: UIViewController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}

final public class Coordinator: CoordinatorProtocol {
    var nav: UINavigationController

    public init(nav: UINavigationController) {
        self.nav = nav
    }

    public func start() {
        let viewController =  ViewController()
        nav.pushViewController(viewController, animated: false)
    }
}
