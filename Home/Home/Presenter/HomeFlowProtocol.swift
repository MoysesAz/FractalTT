import Foundation

public protocol HomeFlowProtocol {
    func showDetailsView(_ productModel: ProductsModel)
    func showGalery()
}

extension HomeViewController: HomeFlowProtocol {
    public func showDetailsView(_ productModel: ProductsModel) {
        flowdelegate?.showDetailsView(productModel)
    }

    public func showGalery() {
        flowdelegate?.showGalery()
    }
}
