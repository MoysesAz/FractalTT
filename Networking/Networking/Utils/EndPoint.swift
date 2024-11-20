import Foundation

public protocol Endpoint {
    var baseUrl: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var queries: [String: String] { get }
    var headers: [String: String] { get }
    var body: Data? { get }
}
