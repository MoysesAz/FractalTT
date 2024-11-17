import Foundation
import FractalData

public protocol ProductDetailsModelProtocol {
    init(managerData: ManagerDataProtocol?)
    func saveProduct(tagTitle: String,
                     productName: String,
                     productDescription: String,
                     image: Data)
    func delete(tagTitle: String,
                productName: String,
                productDescription: String,
                image: Data)
}

public class ProductDetailsModel {
    var managerData: ManagerDataProtocol?

    public required init(managerData: ManagerDataProtocol? = nil) {
        self.managerData = managerData
    }
}

extension ProductDetailsModel: ProductDetailsModelProtocol {
    public func saveProduct(tagTitle: String, productName: String, productDescription: String, image: Data) {
        _ = managerData?.createProduct(tag: tagTitle,
                                   productDescription: productDescription,
                                   product: productName,
                                   image: image)
    }

    public func delete(tagTitle: String,
                       productName: String,
                       productDescription: String,
                       image: Data) {
        _ = managerData?.deleteProduct(tag: tagTitle,
                                       productDescription: productDescription,
                                       product: productName,
                                       image: image)
    }

}
