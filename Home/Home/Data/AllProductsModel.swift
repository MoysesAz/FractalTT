import Foundation

public struct AllProductsModel: Decodable {
    public var info: PaginationAllProductsModel
    public var results: [ProductsModel]

    init(info: PaginationAllProductsModel, results: [ProductsModel]) {
        self.info = info
        self.results = results
    }
}
