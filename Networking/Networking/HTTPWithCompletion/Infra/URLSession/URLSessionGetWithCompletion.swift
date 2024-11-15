import Foundation

final public class URLSessionGetWithCompletion: HTTPGetWithCompletionProtocol,
                                                RequestGuardProtocol,
                                                URLRequestWithCompletionProtocol {
    public var url: String?

    public init() {}

    public func handler<T>(headers: [String: String]? = nil,
                           responseType: T.Type,
                           completion: @escaping (Result<T, any Error>) -> Void) where T: Decodable {

        do {
            let validateURL = try validateURLString(url)
            var urlRequest = URLRequest(url: validateURL)

            if let headers = headers {
                _ = headers.map {urlRequest.addValue($1, forHTTPHeaderField: $0)}
            }
            Log.request(urlRequest)
            request(urlRequest, completion: completion)
        } catch {
            completion(.failure(error))
        }
    }
}
