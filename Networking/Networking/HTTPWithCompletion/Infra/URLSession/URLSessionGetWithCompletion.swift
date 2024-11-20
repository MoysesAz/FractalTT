import Foundation
import Commons
final public class URLSessionGetWithCompletion: HTTPGetWithCompletionProtocol {
    let validator: RequestValidatorProtocol
    let networkService: NetworkingServiceProtocol

    public init(validator: RequestValidatorProtocol = RequestValidator(),
                networkingService: NetworkingServiceProtocol = NetworkingService()) {
        self.validator = validator
        self.networkService = networkingService
    }

    public var url: String?

    public func handler<T>(headers: [String: String]? = nil,
                           responseType: T.Type,
                           completion: @escaping (Result<T, any Error>) -> Void) where T: Decodable {

        do {
            let validateURL = try validator.validateURLString(url)
            var urlRequest = URLRequest(url: validateURL)

            if let headers = headers {
                _ = headers.map {urlRequest.addValue($1, forHTTPHeaderField: $0)}
            }
            Log.request(urlRequest)
            networkService.executeRequest(urlRequest, completion: completion)
        } catch {
            completion(.failure(error))
        }
    }
}
