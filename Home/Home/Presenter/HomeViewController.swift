import UIKit
import Networking

final public class HomeViewController: UIViewController {
    let viewModel: HomeViewModelProtocol
    var contentView: HomeViewProtocol
    var flowdelegate: HomeFlowProtocol?

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
        setTablewView()
    }

    private func setTablewView() {
        guard let homeView = contentView as? HomeView else {
            return
        }
        homeView.tableView.dataSource = self
        homeView.tableView.delegate = self
    }

}
