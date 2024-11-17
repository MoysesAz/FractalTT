import UIKit
import Home
import DesignSystem
import ProductDetails

final public class MainCoordinator: CoordinatorProtocol {
    var nav: UINavigationController

    public init(nav: UINavigationController) {
        self.nav = nav
    }

    public func start() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = Luxus.Tokens.Colors.Primary.lxSecondary
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

        nav.navigationBar.standardAppearance = appearance
        nav.navigationBar.scrollEdgeAppearance = appearance
        nav.navigationBar.compactAppearance = appearance

        let viewController = HomeFactory.make(self)
        nav.pushViewController(viewController, animated: false)
    }
}

extension MainCoordinator: HomeFlowProtocol {
    public func showDetailsView(_ drink: Home.CharactersModel) {
        let viewController = ProductDetailsViewController(drink)
        nav.pushViewController(viewController, animated: true)
    }
}
