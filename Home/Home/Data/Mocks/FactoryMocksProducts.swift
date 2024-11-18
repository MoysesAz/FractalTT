import Foundation

final public class FactoryMocksProducts {
    public static func makeAllProducts() -> AllProductsModel {
        .init(info: makePaginationAllProductsModel(), results: [makeProductModel()])
    }

    public static func makeProductModel() -> ProductsModel {
        return .init(id: 99,
                     name: "Mrs. Mock",
                     status: "Live",
                     species: "Mock",
                     type: "False",
                     gender: "Neutral",
                     image: "https://via.placeholder.com/150")
    }

    public static func makePaginationAllProductsModel() -> PaginationAllProductsModel {
        return .init(prev: "", next: "")
    }


}
