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
        title = viewModel.getProduct().name
        self.contentView.delegate = self.viewModel
        let productModel  = viewModel.getProduct()
        contentView.setupDetails(productModel.name,
                                 nameProduct: productModel.species,
                                 descriptionText: productModel.status,
                                 urlImage: productModel.image)
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
    }

}
