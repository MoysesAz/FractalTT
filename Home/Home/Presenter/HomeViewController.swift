import UIKit
import Networking
import DesignSystem

final public class HomeViewController: UIViewController {
    let viewModel: HomeViewModelProtocol
    var contentView: HomeViewProtocol
    var flowdelegate: HomeFlowProtocol?
    let searchController = UISearchController()

    init(contentView: some HomeViewProtocol = HomeView(),
         viewModel: some HomeViewModelProtocol = HomeViewModel()) {
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
        setupNavigation()
        setupBinds()
        setupApi()
        setupCollectionView()
    }

    private func setupBinds() {
        guard let homeView = contentView as? HomeView else {
            return
        }

        viewModel.filterCollectionView.bind { _ in
            DispatchQueue.main.async {
                homeView.collectionView.reloadData()
            }
        }
    }

    private func setupNavigation() {
        title = "Home"
        navigationController?.navigationBar.prefersLargeTitles = true
        setupSearchBar()
    }

    private func setupApi() {
        viewModel.getAllCharacters()
    }

    private func setupCollectionView() {
        guard let homeView = contentView as? HomeView else {
            return
        }
        homeView.collectionView.dataSource = self
        homeView.collectionView.delegate = self
        homeView.collectionView.reloadData()
    }

    private func setupSearchBar() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.searchTextField.backgroundColor = .white
        searchController.searchBar.backgroundColor = .clear
        searchController.searchBar.searchTextField.placeholder = "Search for a product"
        navigationItem.searchController = searchController
    }

}
