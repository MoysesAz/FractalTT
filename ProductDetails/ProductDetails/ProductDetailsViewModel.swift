import Home
import FractalData
import CoreData

public protocol ProductDetailsViewModelProtocol {
    func isSaved() -> Bool
    func getProduct() -> ProductsModel
    func saveProduct(tagTitle: String,
                     productName: String,
                     productDescription: String,
                     image: Data) -> Bool
    func delete(productName: String) -> Bool
}

public class ProductDetailsViewModel {
    public var dataStore: ProductDetailsDataStoreProtocol?
    let productModel: ProductsModel

    public init(dataStore: ProductDetailsDataStoreProtocol? = ProductDetailsDataStore(),
                productModel: ProductsModel = FactoryMocksProducts.makeProductModel()) {
        self.dataStore = dataStore
        self.productModel = productModel
    }
}

extension ProductDetailsViewModel: ProductDetailsViewModelProtocol {
    public func getProduct() -> ProductsModel {
        return productModel
    }

    public func isSaved() -> Bool {
        guard let isSaved =  getProducts(byProductName: productModel.name) else {
            return false
        }

        return !isSaved.isEmpty
    }

    private func getProducts(byProductName product: String) -> [Products]? {
        let products =  dataStore?.getProduct(byProductName: product)
        return products
    }

    public func saveProduct(tagTitle: String, productName: String, productDescription: String, image: Data) -> Bool {
        let result = dataStore?.createProduct(product: productName, tag: tagTitle,
                                              productDescription: productDescription,
                                              image: image)

        guard let newResult = result else {
            return false
        }

        return newResult
    }

    public func delete(productName: String) -> Bool {
        let result = dataStore?.deleteProduct(byProductName: productName)
        guard let newResult = result else {
            return false
        }

        return newResult
    }
}
