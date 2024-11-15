import Foundation

public enum NetworkErrors: Error {
    case nullURL
    case invalidURL
    case networkFailure(message: String)
    case unauthorized
    case decodingError
    case encodingError
    case noData
}
