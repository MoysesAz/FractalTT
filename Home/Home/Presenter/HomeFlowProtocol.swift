import Foundation

public protocol HomeFlowProtocol {
    func showDetailsView(_ productModel: ProductsModel)
}

extension HomeViewController: HomeFlowProtocol {
    public func showDetailsView(_ productModel: ProductsModel) {
        flowdelegate?.showDetailsView(productModel)
    }
}
