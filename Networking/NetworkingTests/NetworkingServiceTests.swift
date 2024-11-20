import XCTest
@testable import Networking

final class NetworkingServiceTests: XCTestCase {
    private func makeService(with mockSession: MockURLSession) -> NetworkingService {
        return NetworkingService(session: mockSession)
    }

    private func createMockResponse(
        data: Data?,
        statusCode: Int = 200,
        error: Error? = nil
    ) -> MockURLSession {
        let mockSession = MockURLSession()
        mockSession.data = data
        mockSession.error = error
        mockSession.response = HTTPURLResponse(
            url: URL(string: "https://example.com")!,
            statusCode: statusCode,
            httpVersion: nil,
            headerFields: nil
        )
        return mockSession
    }

    func test_executeRequest_successfulResponse() {
        let mockData = """
        {
            "key": "value"
        }
        """.data(using: .utf8)
        let mockSession = createMockResponse(data: mockData)
        let service = makeService(with: mockSession)
        let expectation = XCTestExpectation(description: "Completion handler called")

        service.executeRequest(URLRequest(url: URL(string: "mock.com")!)) { (result: Result<[String: String], Error>) in
            if case .success(let response) = result {
                XCTAssertEqual(response["key"], "value")
            } else {
                XCTFail("Expected successful response")
            }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }

    func test_executeRequest_shouldReturnError_whenSessionHasError() {
        let mockSession = createMockResponse(data: nil, error: NetworkErrors.invalidURL)
        let service = makeService(with: mockSession)
        let expectation = XCTestExpectation(description: "Completion handler called")
        let expectetError = NetworkErrors.networkFailure(message:"The operation couldn’t be completed. (Networking.NetworkErrors error 2.)")
        service.executeRequest(URLRequest(url: URL(string: "mock.com")!)) { (result: Result<[String: String], Error>) in
            if case .failure(let error) = result {
                XCTAssertEqual(error as? NetworkErrors, expectetError)
            } else {
                XCTFail("Expected to throw an error")
            }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }

    func test_executeRequest_shouldReturnError_whenNoData() {
        let mockSession = createMockResponse(data: nil)
        let service = makeService(with: mockSession)
        let expectation = XCTestExpectation(description: "Completion handler called")

        service.executeRequest(URLRequest(url: URL(string: "mock.com")!)) { (result: Result<[String: String], Error>) in
            if case .failure(let error) = result {
                XCTAssertEqual(error as? NetworkErrors, .noData)
            } else {
                XCTFail("Expected to throw noData error")
            }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }

    func test_executeRequest_shouldReturnDecodingError_forMalformedJSON() {
        let mockData = """
        {
            "key: "value"
        }
        """.data(using: .utf8)
        let mockSession = createMockResponse(data: mockData)
        let service = makeService(with: mockSession)
        let expectation = XCTestExpectation(description: "Completion handler called")

        service.executeRequest(URLRequest(url: URL(string: "mock.com")!)) { (result: Result<[String: String], Error>) in
            if case .failure(let error) = result {
                XCTAssertEqual(error as? NetworkErrors, .decodingError)
            } else {
                XCTFail("Expected to throw decodingError")
            }
            expectation.fulfill()
        }

        wait(for: [expectation], timeout: 1.0)
    }
}
