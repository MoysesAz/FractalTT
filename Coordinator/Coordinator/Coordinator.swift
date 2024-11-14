import UIKit
import Home

final public class Coordinator: CoordinatorProtocol {
    var nav: UINavigationController

    public init(nav: UINavigationController) {
        self.nav = nav
    }

    public func start() {
        let viewController =  HomeFactory.make()
        nav.pushViewController(viewController, animated: false)
    }
}
