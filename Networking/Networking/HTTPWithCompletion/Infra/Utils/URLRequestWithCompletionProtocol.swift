import Foundation
import Commons

protocol URLRequestWithCompletionProtocol {}

extension URLRequestWithCompletionProtocol {
    public func request<T: Decodable>(_ urlRequest: URLRequest, completion: @escaping ((Result<T, Error>) -> Void)) {
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in

            if let error = error {
                Log.message(error.localizedDescription, .failure)
                completion(.failure(NetworkErrors.networkFailure(message: error.localizedDescription)))
                return
            }

            if let response = response as? HTTPURLResponse {
                Log.response(response)
            }

            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedResponse))
                } catch {
                    Log.message("Decoding error: " + error.localizedDescription, .failure)
                    completion(.failure(NetworkErrors.decodingError))
                }
            } else {
                Log.message("No data received", .failure)
                completion(.failure(NetworkErrors.noData))
            }
        }
        task.resume()
    }
}
