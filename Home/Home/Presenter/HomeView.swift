import UIKit
import DesignSystem

public protocol HomeViewProtocol {
}

final public class HomeView: UIView, HomeViewProtocol {
    public var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(HomeDrinkCell.self, forCellWithReuseIdentifier: HomeDrinkCell.identifier)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear
        return collectionView
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
        addSubview(collectionView)
    }

    private func setupAllConstraints() {
        collectionViewConstraints()

    }
}

extension HomeView {
    private func collectionViewConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
