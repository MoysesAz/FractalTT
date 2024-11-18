import Foundation
import Home
import FractalData

public protocol ProductDetailsViewModelProtocol {
    init(managerData: ManagerDataProtocol?)
    var productModel: CharactersModel? { get set }
    var productSave: Bool { get set }
    func saveProduct(tagTitle: String,
                     productName: String,
                     productDescription: String,
                     image: Data) -> Bool
    func delete(productName: String) -> Bool
    func getProducts(byProductName product: String) -> [Products]?
}

public class ProductDetailsViewModel {
    var managerData: ManagerDataProtocol?
    public var productSave: Bool = false
    public var productModel: CharactersModel? = nil

    public required init(managerData: ManagerDataProtocol? = nil) {
        self.managerData = managerData
    }
}

extension ProductDetailsViewModel: ProductDetailsViewModelProtocol {
    public func getProducts(byProductName product: String) -> [FractalData.Products]? {
        let products = managerData?.getProducts(byProductName: product)
        return products
    }

    public func saveProduct(tagTitle: String, productName: String, productDescription: String, image: Data) -> Bool {
        let result = managerData?.createProduct(tag: tagTitle,
                                   productDescription: productDescription,
                                   product: productName,
                                   image: image)

        guard let newResult = result else {
            return false
        }

        return newResult
    }

    public func delete(productName: String) -> Bool {
        let result = managerData?.deleteProduct(byProductName: productName)
        guard let newResult = result else {
            return false
        }

        return newResult
    }
}
