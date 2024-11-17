import UIKit
import Home

final public class ProductDetailsViewController: UIViewController {
    let viewModel: ProductDetailsModelProtocol
    var contentView: ProductDetailsViewProtocol
    var flowdelegate: ProductDetailsFlowProtocol?

    public init(_ characters: CharactersModel,
                contentView: some ProductDetailsViewProtocol = ProductDetailsView(),
                viewModel: some ProductDetailsModelProtocol = ProductDetailsModel()) {

        self.contentView = contentView
        self.viewModel = viewModel
        contentView.setupDetails(characters.name,
                                 nameProduct: characters.species,
                                 descriptionText: characters.status,
                                 urlImage: characters.image)

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
    }

    private func setupBinds() {

    }

    private func setupItensInNavigation() {

    }
}
