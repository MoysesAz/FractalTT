import Foundation

public struct AllCharacteresModel: Decodable {
    public var info: InfoModel
    public var results: [CharactersModel]
}

public struct InfoModel: Decodable {
    public var prev: String?
    public var next: String?

}

public struct CharactersModel: Decodable {
    public var id: Int
    public var name: String
    public var status: String
    public var species: String
    public var type: String
    public var gender: String
    public var image: String
}
