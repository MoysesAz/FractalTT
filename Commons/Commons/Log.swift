import Foundation

public enum LogMessageOption {
    case failure
    case success
    case warning
}

public struct Log {
    public static func data(_ data: Data, encoder: String.Encoding = .utf8) {
        #if DEBUG
        print("========DATA===========")
        let object = String(data: data, encoding: encoder)

        if let object {
            print(object)
        } else {
            print("can not read data")
        }
        #endif
    }

    public static func message(_ content: String, _ option: LogMessageOption) {
        #if DEBUG
        let message: String

        switch option {
        case .failure:
            message = "❌ [FAILURE] - \(content)"
        case .success:
            message = "✅ [SUCCESS] - \(content)"
        case .warning:
            message = "⚠️ [WARNING] - \(content)"
        }

        print(message)
        #endif
    }

    public static func request(_ request: URLRequest) {
        #if DEBUG
        print("========REQUEST===========")
        print("URL: \(String(describing: request.url))")
        print("HEADERS: \(String(describing: request.allHTTPHeaderFields))")
        print("METHOD: \(String(describing: request.httpMethod))")
        if let body = request.httpBody {
            print("BODY: \(String(describing: String(data: body, encoding: .utf8)))")
        } else {
            print("BODY: nil")
        }
        #endif
    }

    public static func response(_ response: HTTPURLResponse) {
        #if DEBUG
        print("========RESPONSE===========")
        if response.statusCode < 300, response.statusCode >= 200 {
            print("NICE CALL 🚀")
        }
        print("STATUS-CODE: \(response.statusCode)")
        #endif
    }
}
