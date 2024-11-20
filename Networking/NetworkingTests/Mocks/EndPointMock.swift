import Foundation
import Networking

final class EndpointMock: Endpoint {
    var baseUrl: String = "https://api.example.com"

    var path: String = "/users"

    var method: Networking.HTTPMethod = .GET

    var queries: [String : String] = [:]

    var headers: [String : String] = ["Authorization": "Bearer token"]

    var body: Data? = nil

}
