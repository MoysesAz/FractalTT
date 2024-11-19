import Foundation
import Networking

final class RickaAdMortyApiEndPoint: Endpoint {
    var baseUrl: String = "https://www.rickandmortyapi.com/api"

    var path: String = "/character"

    var method: Networking.HTTPMethod = .GET

    var queries: [String: String] = [:]

    var headers: [String: String] = [:]

    var body: Data?
}
