import Foundation
import FractalData
import Commons
public protocol SavedProductsViewModelProtocol {
    var cacheCollectionView: BindableObject<[Products]?> { get set }
    func getAllProducts() -> Bool
}

public final class SavedProductsViewModel: SavedProductsViewModelProtocol {
    public var dataStore: SavedProductsDataStoreProtocol?
    public var cacheCollectionView: BindableObject<[Products]?> = BindableObject(nil)

    public init(dataStore: SavedProductsDataStoreProtocol? = nil) {
        self.dataStore = dataStore
    }

    public func getAllProducts() -> Bool {
        guard let results =  dataStore?.getAllProducts() else {
            return false
        }

        cacheCollectionView.value = results
        return true
    }
}
