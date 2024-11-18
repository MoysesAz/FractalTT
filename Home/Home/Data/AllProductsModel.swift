import Foundation

public struct AllProductsModel: Decodable {
    public var info: InfoModel
    public var results: [CharactersModel]
}
