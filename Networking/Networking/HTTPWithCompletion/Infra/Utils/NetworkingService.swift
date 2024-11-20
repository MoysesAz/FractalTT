import Foundation
import Commons

public protocol NetworkingServiceProtocol {
    func executeRequest<T: Decodable>(_ urlRequest: URLRequest, completion: @escaping (Result<T, Error>) -> Void)
}

final public class NetworkingService: NetworkingServiceProtocol {
    private let session: URLSessionProtocol

    public init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }

    public func executeRequest<T: Decodable>(_ urlRequest: URLRequest,
                                             completion: @escaping (Result<T, Error>) -> Void) {
        let task = session.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                Log.message(error.localizedDescription, .failure)
                completion(.failure(NetworkErrors.networkFailure(message: error.localizedDescription)))
                return
            }

            if let response = response as? HTTPURLResponse {
                Log.response(response)
            }

            guard let data = data else {
                Log.message("No data received", .failure)
                completion(.failure(NetworkErrors.noData))
                return
            }

            do {
                let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedResponse))
            } catch {
                Log.message("Decoding error: " + error.localizedDescription, .failure)
                completion(.failure(NetworkErrors.decodingError))
            }
        }
        task.resume()
    }
}

