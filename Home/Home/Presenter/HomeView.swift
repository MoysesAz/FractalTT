import UIKit
import DesignSystem

public protocol HomeViewProtocol {
    func emptySearchViewOn()
    func emptySearchViewOff()
}

final public class HomeView: UIView {
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(HomeDrinkCell.self, forCellWithReuseIdentifier: HomeDrinkCell.identifier)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()

    lazy var emptySearch: UIView = {
        let emptySearch = UIView(frame: .zero)
        emptySearch.backgroundColor = Luxus.Tokens.Colors.Background.lxPrimary
        emptySearch.isHidden = true
        emptySearch.translatesAutoresizingMaskIntoConstraints = false
        return emptySearch
    }()

    lazy var searchIcon: UIImageView = {
        let searchIcon = UIImageView(frame: .zero)
        searchIcon.image = UIImage(named: "Images/Searching")
        searchIcon.translatesAutoresizingMaskIntoConstraints = false
        return searchIcon
    }()

    lazy var warningLabel: UILabel = {
        let warningLabel = UILabel(frame: .zero)
        warningLabel.textAlignment = .center
        warningLabel.text = "No result were found"
        warningLabel.font = UIFont.systemFont(ofSize: 18)
        warningLabel.textColor = Luxus.Tokens.Colors.Font.lxPrimary
        warningLabel.translatesAutoresizingMaskIntoConstraints = false
        return warningLabel
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

extension HomeView: HomeViewProtocol {
    public func emptySearchViewOn() {
        DispatchQueue.main.async {
            self.emptySearch.isHidden = false
        }
    }
    public func emptySearchViewOff() {
        DispatchQueue.main.async {
            self.emptySearch.isHidden = true
        }
    }
}

extension HomeView {
    private func setup() {
        addSubview(collectionView)
        addSubview(emptySearch)
        emptySearch.addSubview(searchIcon)
        emptySearch.addSubview(warningLabel)

    }

    private func setupAllConstraints() {
        collectionViewConstraints()
        emptySearchConstraints()
        searchIconConstraints()
        warningLabelConstraints()
    }
}

extension HomeView {
    private func collectionViewConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    private func emptySearchConstraints() {
        NSLayoutConstraint.activate([
            emptySearch.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            emptySearch.bottomAnchor.constraint(equalTo: bottomAnchor),
            emptySearch.leadingAnchor.constraint(equalTo: leadingAnchor),
            emptySearch.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    private func searchIconConstraints() {
        NSLayoutConstraint.activate([
            searchIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            searchIcon.centerXAnchor.constraint(equalTo: centerXAnchor),
            searchIcon.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2),
            searchIcon.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2)
        ])
    }

    private func warningLabelConstraints() {
        NSLayoutConstraint.activate([
            warningLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            warningLabel.widthAnchor.constraint(equalTo: widthAnchor),
            warningLabel.topAnchor.constraint(equalTo: searchIcon.bottomAnchor, constant: 30)
        ])
    }
}
