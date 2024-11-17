import Foundation
import Commons

final public class URLSessionPutWithCompletion: HTTPPutWithCompletionProtocol,
                                                 RequestGuardProtocol,
                                                 URLRequestWithCompletionProtocol {
    public var url: String?

    public init() {}

    public func handler<T>(body: Data? = nil,
                           parameters: [String: Any]? = nil,
                           headers: [String: String] = [:],
                           responseType: T.Type,
                           completion: @escaping (Result<T, Error>) -> Void) where T: Decodable {

        do {
            let validateURL = try validateURLString(url)
            var urlRequest = URLRequest(url: validateURL)
            urlRequest.httpMethod = "PUT"
            if let parameters = parameters {
                let validateData = try validateParameters(parameters)
                urlRequest.httpBody = validateData
            } else if let body = body {
                urlRequest.httpBody = body
                Log.message("Body provided directly as Data", .success)
            }
            _ = headers.map {urlRequest.addValue($1, forHTTPHeaderField: $0)}
            Log.request(urlRequest)
            request(urlRequest, completion: completion)

        } catch let error {
            completion(.failure(error))
        }

    }
}
