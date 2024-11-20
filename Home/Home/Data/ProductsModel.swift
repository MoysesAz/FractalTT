import Foundation

public struct ProductsModel: Decodable {
    public var id: Int
    public var name: String
    public var status: String
    public var species: String
    public var type: String
    public var gender: String
    public var image: String

    public init(id: Int,
                name: String,
                status: String,
                species: String,
                type: String,
                gender: String,
                image: String) {

        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.image = image
    }
}
