import Foundation
import Networking

final class RickaAdMortyApiEndPoint: Endpoint {
    var baseUrl: String = "https://rickandmortyapi.com/api"

    var path: String = "/character/1,183"

    var method: Networking.HTTPMethod = .GET

    var queries: [String: String] = [:]

    var headers: [String: String] = [:]

    var body: Data?
}
