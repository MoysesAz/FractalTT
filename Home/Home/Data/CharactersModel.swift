import Foundation

public struct CharactersModel: Decodable {
    public var id: Int
    public var name: String
    public var status: String
    public var species: String
    public var type: String
    public var gender: String
    public var image: String
}
