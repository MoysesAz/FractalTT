import Foundation
import FractalData
import SavedProducts

class SavedProductsDataStoreMock: SavedProductsDataStoreProtocol {
    var mockedProducts: [Products]?

    func getAllProducts() -> [Products]? {
        return mockedProducts
    }
}
