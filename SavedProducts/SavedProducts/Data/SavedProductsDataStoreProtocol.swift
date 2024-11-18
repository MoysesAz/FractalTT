import Foundation
import FractalData

public protocol SavedProductsDataStoreProtocol {
    func getAllProducts() -> [Products]?
}
