import XCTest
@testable import Home

class HomeViewModelTests: XCTestCase {

    var viewModel: HomeViewModel!
    var networkSpy: NetworkWithCompletionSpy!
    var endPoint: RickaAdMortyApiEndPoint!

    override func setUp() {
        super.setUp()
        networkSpy = NetworkWithCompletionSpy()
        endPoint = RickaAdMortyApiEndPoint()
        viewModel = HomeViewModel(network: networkSpy, endPoint: endPoint)
    }

    override func tearDown() {
        viewModel = nil
        networkSpy = nil
        endPoint = nil
        super.tearDown()
    }

    func test_getAllCharacters_firstCall_shouldPopulateCacheAndFilter_with_cacheIsEmpty_and_next() {
        let product1 = ProductsModel(id: 4,
                                     name: "Product1",
                                     status: "ok",
                                     species: "human",
                                     type: "type",
                                     gender: "ok",
                                     image: "www.image.com")
        let product2 = ProductsModel(id: 6, name: "Product2",
                                     status: "ok",
                                     species: "human",
                                     type: "type",
                                     gender: "ok",
                                     image: "www.image.com")
        let infoModel = PaginationAllProductsModel(next: "https://nextpage.com")
        let mockData = AllProductsModel(
            info: infoModel,
            results: [product1, product2]
        )

        let sucess: Result<AllProductsModel, any Error> = .success(mockData)
        networkSpy.resultToReturn = sucess
        viewModel.cacheCollectionView.value = []
        viewModel.getAllCharacters()

        XCTAssertEqual(viewModel.cacheCollectionView.value?.count, 2)
        XCTAssertEqual(viewModel.filterCollectionView.value.count, 2)
        XCTAssertEqual(viewModel.cacheCollectionView.value?.first?.name, "Product1")
        XCTAssertEqual(endPoint.baseUrl, "https://nextpage.com")
    }

    func test_getAllCharacters_firstCall_should_ReturnNil_with_cacheIsEmpty_and_nextIsNull() {
        let product1 = ProductsModel(id: 4,
                                     name: "Product1",
                                     status: "ok",
                                     species: "human",
                                     type: "type",
                                     gender: "ok",
                                     image: "www.image.com")
        let product2 = ProductsModel(id: 6, name: "Product2",
                                     status: "ok",
                                     species: "human",
                                     type: "type",
                                     gender: "ok",
                                     image: "www.image.com")
        let infoModel = PaginationAllProductsModel(next: nil)
        let mockData = AllProductsModel(
            info: infoModel,
            results: [product1, product2]
        )

        let sucess: Result<AllProductsModel, any Error> = .success(mockData)
        networkSpy.resultToReturn = sucess
        viewModel.cacheCollectionView.value = []
        viewModel.getAllCharacters()
        XCTAssertEqual(viewModel.cacheCollectionView.value?.count, 2)
        XCTAssertEqual(viewModel.filterCollectionView.value.count, 2)
        XCTAssertEqual(viewModel.cacheCollectionView.value?.first?.name, "Product1")
        XCTAssertEqual(endPoint.baseUrl, "https://www.rickandmortyapi.com/api")
        XCTAssertEqual(endPoint.path, "/character")
    }

    func test_getAllCharacters_firstCall_shouldPopulateCacheAndFilter_with_cacheIsNotEmpty() {
        let product1 = ProductsModel(id: 4,
                                     name: "Product1",
                                     status: "ok",
                                     species: "human",
                                     type: "type",
                                     gender: "ok",
                                     image: "www.image.com")
        let product2 = ProductsModel(id: 6, name: "Product2",
                                     status: "ok",
                                     species: "human",
                                     type: "type",
                                     gender: "ok",
                                     image: "www.image.com")
        let infoModel = PaginationAllProductsModel(next: "https://nextpage.com")
        let mockData = AllProductsModel(
            info: infoModel,
            results: [product2]
        )
        let sucess: Result<AllProductsModel, any Error> = .success(mockData)
        networkSpy.resultToReturn = sucess
        viewModel.cacheCollectionView.value = [product1]
        viewModel.getAllCharacters()

        XCTAssertEqual(viewModel.cacheCollectionView.value?.count, 2)
        XCTAssertEqual(viewModel.filterCollectionView.value.count, 2)
        XCTAssertEqual(viewModel.cacheCollectionView.value?.last?.name, "Product2")
        XCTAssertEqual(endPoint.baseUrl, "https://nextpage.com")
    }

    func test_getAllCharacters_firstCall_should_ReturnNil_with_cacheIsNotEmpty_and_nextIsNull() {
        let product1 = ProductsModel(id: 4,
                                     name: "Product1",
                                     status: "ok",
                                     species: "human",
                                     type: "type",
                                     gender: "ok",
                                     image: "www.image.com")
        let product2 = ProductsModel(id: 6,
                                     name: "Product2",
                                     status: "ok",
                                     species: "human",
                                     type: "type",
                                     gender: "ok",
                                     image: "www.image.com")
        let infoModel = PaginationAllProductsModel(next: nil)
        let mockData = AllProductsModel(
            info: infoModel,
            results: [product1, product2]
        )

        let sucess: Result<AllProductsModel, any Error> = .success(mockData)
        networkSpy.resultToReturn = sucess
        viewModel.cacheCollectionView.value = nil
        viewModel.getAllCharacters()
        XCTAssertEqual(viewModel.cacheCollectionView.value?.count, 2)
        XCTAssertEqual(viewModel.filterCollectionView.value.count, 2)
        XCTAssertEqual(viewModel.cacheCollectionView.value?.first?.name, "Product1")
        XCTAssertEqual(endPoint.baseUrl, "https://www.rickandmortyapi.com/api")
        XCTAssertEqual(endPoint.path, "/character")
    }
}
