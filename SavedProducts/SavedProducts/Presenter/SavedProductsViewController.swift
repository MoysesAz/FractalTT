import UIKit
import Networking
import DesignSystem

final public class SavedProductsViewController: UIViewController {
    let viewModel: SavedProductsViewModelProtocol
    var contentView: SavedProductsViewProtocol
    var flowdelegate: SavedProductsFlowProtocol?

    public init(contentView: some SavedProductsViewProtocol = SavedProductsView(),
         viewModel: some SavedProductsViewModelProtocol = SavedProductsViewModel()) {
        self.contentView = contentView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func loadView() {
        guard let homeView = contentView as? UIView else {
            return
        }
        view = homeView
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupBinds()
        setupCollectionView()
        _ = viewModel.getAllProducts()
    }

    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false

    }

    private func setupBinds() {
        guard let savedProductsView = contentView as? SavedProductsView else {
            return
        }

        viewModel.cacheCollectionView.bind { _ in
            DispatchQueue.main.async {
                savedProductsView.collectionView.reloadData()
            }
        }
    }

    private func setupNavigation() {
        title = "Gallery"
        navigationController?.navigationBar.prefersLargeTitles = false
    }

    private func setupCollectionView() {
        guard let savedProductsView = contentView as? SavedProductsView else {
            return
        }
        savedProductsView.collectionView.dataSource = self
        savedProductsView.collectionView.delegate = self
    }
}
