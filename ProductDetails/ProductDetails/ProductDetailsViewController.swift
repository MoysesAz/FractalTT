import UIKit
import Home
import FractalData

final public class ProductDetailsViewController: UIViewController {
    var viewModel: ProductDetailsViewModelProtocol
    var contentView: ProductDetailsViewProtocol
    var flowdelegate: ProductDetailsFlowProtocol?

    public init(contentView: some ProductDetailsViewProtocol = ProductDetailsView(),
                viewModel: some ProductDetailsViewModelProtocol = ProductDetailsViewModel()) {

        self.contentView = contentView
        self.viewModel = viewModel
        self.viewModel.productSave = false

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func loadView() {
        guard let productDetailsView = contentView as? UIView else {
            return
        }
        view = productDetailsView
    }

    public override func viewDidLoad() {
        self.contentView.delegate = self.viewModel

        guard let productModel = viewModel.productModel else {
            return
        }
        contentView.setupDetails(productModel.name,
                                 nameProduct: productModel.species,
                                 descriptionText: productModel.status,
                                 urlImage: productModel.image)
    }
}
