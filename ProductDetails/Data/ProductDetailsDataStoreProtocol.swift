import Foundation
import FractalData

public protocol ProductDetailsDataStoreProtocol {
    func getProduct(byProductName product: String) -> [Products]?
    func createProduct(product: String, tag: String, productDescription: String, image: Data) -> Bool
    func deleteProduct(byProductName product: String) -> Bool
}
