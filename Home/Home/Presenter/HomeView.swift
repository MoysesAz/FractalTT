import UIKit
import DesignSystem

public protocol HomeViewProtocol {
}

final public class HomeView: UIView, HomeViewProtocol {
     public var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(HomeDrinkCell.self, forCellReuseIdentifier: HomeDrinkCell.identifier)
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.rowHeight = 100
        return tableView
    }()

    public override init(frame: CGRect) {
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func willMove(toWindow newWindow: UIWindow?) {
        backgroundColor = Luxus.Tokens.Colors.Background.lxPrimary
        setup()
        setupAllConstraints()
    }
}

extension HomeView {
    private func setup() {
        addSubview(tableView)
    }

    private func setupAllConstraints() {
        tableViewConstraints()
    }
}

extension HomeView {
    private func tableViewConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
}
