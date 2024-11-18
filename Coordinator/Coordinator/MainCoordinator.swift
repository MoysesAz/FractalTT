import UIKit
import CoreData
import Home
import DesignSystem
import ProductDetails

final public class MainCoordinator: CoordinatorProtocol {
    var coreDataContext: NSManagedObjectContext?
    var nav: UINavigationController

    public init(nav: UINavigationController, coreDataContext: NSManagedObjectContext? = nil) {
        self.coreDataContext = coreDataContext
        self.nav = nav
    }

    public func start() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = Luxus.Tokens.Colors.Primary.lxPrimary
        appearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]

        nav.navigationBar.standardAppearance = appearance
        nav.navigationBar.scrollEdgeAppearance = appearance
        nav.navigationBar.compactAppearance = appearance
        nav.navigationBar.tintColor = .white

        let viewController = HomeFactory.make(self)
        nav.pushViewController(viewController, animated: false)
    }
}

extension MainCoordinator: HomeFlowProtocol {
    public func showDetailsView(_ productModel: ProductsModel) {
        let dataStore = ProductDetailsDataStore(coreDataContext)
        let viewModel = ProductDetailsViewModel(dataStore: dataStore, productModel: productModel)
        let viewController = ProductDetailsViewController(viewModel: viewModel)
        nav.pushViewController(viewController, animated: true)
    }
}
