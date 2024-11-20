import XCTest
import FractalData
import Home
import ProductDetails

@testable import ProductDetails

final class ProductDetailsViewModelTests: XCTestCase {
    var mockDataStore: ProductDetailsDataStoreMock!
    var viewModel: ProductDetailsViewModel!

    override func setUp() {
        super.setUp()
        mockDataStore = ProductDetailsDataStoreMock()
        let mockProductModel = ProductsModel(id: 1, name: "TestProduct", status: "status", species: "species", type: "", gender: "", image: "")
        viewModel = ProductDetailsViewModel(dataStore: mockDataStore, productModel: mockProductModel)
    }

    override func tearDown() {
        mockDataStore = nil
        viewModel = nil
        super.tearDown()
    }

    func testGetProduct() {
        let product = viewModel.getProduct()
        XCTAssertEqual(product.id, 1)
        XCTAssertEqual(product.name, "TestProduct")
        XCTAssertEqual(product.status, "status")
        XCTAssertEqual(product.species, "species")
        XCTAssertEqual(product.type, "")
        XCTAssertEqual(product.gender, "")
        XCTAssertEqual(product.image, "")

    }

    func testIsSaved_WhenProductDoesNotExist_ShouldReturnFalse() {
        XCTAssertFalse(viewModel.isSaved())
    }

    func testIsSaved_WhenProductExists_ShouldReturnTrue() {
        _ = mockDataStore.createProduct(product: "TestProduct", tag: "species", productDescription: "status", image: Data())
        XCTAssertTrue(viewModel.isSaved())
    }

    func testSaveProduct_ShouldReturnTrue_WhenProductIsSaved() {
        let result = viewModel.saveProduct(tagTitle: "NewTag", productName: "NewProduct", productDescription: "NewDescription", image: Data())
        XCTAssertTrue(result)
    }

    func testSaveProduct_ShouldReturnFalse_WhenProductAlreadyExists() {
        _ = mockDataStore.createProduct(product: "DuplicateProduct", tag: "DuplicateTag", productDescription: "DuplicateDescription", image: Data())
        let result = viewModel.saveProduct(tagTitle: "DuplicateTag", productName: "DuplicateProduct", productDescription: "DuplicateDescription", image: Data())
        XCTAssertFalse(result)
    }

    func testDeleteProduct_ShouldReturnTrue_WhenProductIsDeleted() {
        _ = mockDataStore.createProduct(product: "TestProduct", tag: "TestTag", productDescription: "TestDescription", image: Data())
        let result = viewModel.delete(productName: "TestProduct")
        XCTAssertTrue(result)
    }

    func testDeleteProduct_ShouldReturnFalse_WhenProductDoesNotExist() {
        let result = viewModel.delete(productName: "NonExistentProduct")
        XCTAssertFalse(result)
    }
}
