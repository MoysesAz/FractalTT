import Foundation

public protocol HomeFlowProtocol {
    func showDetailsView(_ drink: CharactersModel)
}

extension HomeViewController: HomeFlowProtocol {
    public func showDetailsView(_ drink: CharactersModel) {
        flowdelegate?.showDetailsView(drink)
    }
}
