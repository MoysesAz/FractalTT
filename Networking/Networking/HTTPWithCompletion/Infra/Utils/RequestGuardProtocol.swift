import Foundation

protocol RequestGuardProtocol {}

extension RequestGuardProtocol {
    public func validateURLString(_ url: String?) throws -> URL {
        guard let urlString = url else {
            Log.message("Url is Null", .failure)
            throw NetworkErrors.nullURL
        }
        guard let newURL = URL(string: urlString) else {
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
