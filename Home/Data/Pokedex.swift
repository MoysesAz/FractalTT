import Foundation
import Networking

public struct Test: Decodable {
    public let results: [Pokemon]
}

public struct Pokemon: Decodable {
    public let name: String
    public let url: String
}

public class Pokedex: Endpoint {
    public var baseUrl: String = "https://pokeapi.co/api/v2/pokemon"

    public var path: String = ""

    public var method: Networking.HTTPMethod = .GET

    public var queries: [String: String] = [:]

    public var headers: [String: String] = [:]

    public var body: Data?
}
