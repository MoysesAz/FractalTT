import Foundation

public enum NetworkErrors: Error, Equatable {
    case nullURL
    case invalidURL
    case encodingError
    case decodingError
    case noData
    case networkFailure(message: String)

    public var localizedDescription: String {
        switch self {
        case .nullURL:
            return "URL is null"
        case .invalidURL:
            return "Invalid URL format"
        case .encodingError:
            return "Failed to encode parameters"
        case .decodingError:
            return "Failed to decode response"
        case .noData:
            return "No data received from server"
        case .networkFailure(let message):
            return "Network failure: \(message)"
        }
    }
}
