import Foundation
import Commons

public protocol RequestValidatorProtocol {
    func validateURLString(_ url: String?) throws -> URL
    func validateParameters(_ parameters: [String: Any]) throws -> Data
}

final public class RequestValidator: RequestValidatorProtocol {
    public init() {}
    public func validateURLString(_ url: String?) throws -> URL {
        guard let urlString = url else {
            Log.message("Url is Null", .failure)
            throw NetworkErrors.nullURL
        }

        var normalizedURL = urlString.starts(with: "https") ? urlString : "https://\(urlString)"
        normalizedURL = urlString.contains(".") ? normalizedURL : ""

        guard let newURL = URL(string: normalizedURL) else {
            Log.message("INVALID URL: \(urlString)", .failure)
            throw NetworkErrors.invalidURL
        }

        Log.message("VALID URL: \(urlString)", .success)
        return newURL
    }

    public func validateParameters(_ parameters: [String: Any]) throws -> Data {
        do {
            Log.message("Parameters encoded as JSON: \(parameters)", .success)
            let data = try JSONSerialization.data(withJSONObject: parameters, options: [])
            return data
        } catch {
            Log.message("Failed to encode parameters: \(error.localizedDescription)", .failure)
            throw NetworkErrors.encodingError
        }
    }
}
