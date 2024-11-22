import Foundation
import ProductDetails
import FractalData
import CoreData

public final class ProductDetailsDataStoreMock: ProductDetailsDataStoreProtocol {
    let context: NSManagedObjectContext?

    init(context: NSManagedObjectContext?) {
        self.context = context
    }

    private var mockProducts: [Products] = []

    public func getProduct(byProductName product: String) -> [Products]? {
        let filteredProducts = mockProducts.filter { $0.product == product }
        return filteredProducts.isEmpty ? nil : filteredProducts
    }

    public func getAllProducts() -> [Products]? {
        return mockProducts.isEmpty ? nil : mockProducts
    }

    public func createProduct(product: String, tag: String, productDescription: String, image: Data) -> Bool {
        if mockProducts.contains(where: { $0.product == product }) {
            return false
        }

        let newProduct = Products(context: context!) // add mockContext
        newProduct.product = product
        newProduct.tag = tag
        newProduct.productDescription = productDescription
        newProduct.image = image

        mockProducts.append(newProduct)
        return true
    }

    public func deleteProduct(byProductName product: String) -> Bool {
        let initialCount = mockProducts.count
        mockProducts.removeAll { $0.product == product }
        return initialCount != mockProducts.count
    }
}
