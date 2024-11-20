import UIKit
import DesignSystem

class HomeProductCell: UICollectionViewCell {
    static let identifier = "HomeProductCell"

    lazy var productImage: UIImageView = {
        let productImage = UIImageView(frame: .zero)
        productImage.image = UIImage(named: "DefaultImage")
        productImage.translatesAutoresizingMaskIntoConstraints = false
        productImage.makeRounded(10)
        return productImage
    }()

    lazy var tagTitle: UILabel = {
        let tagTitle = UILabel(frame: .zero)
        tagTitle.textAlignment = .left
        tagTitle.text = "Default Text"
        tagTitle.font = Luxus.Tokens.Font.montserratBold(18)
        tagTitle.textColor = Luxus.Tokens.Colors.Font.lxPrimary
        tagTitle.translatesAutoresizingMaskIntoConstraints = false
        return tagTitle
    }()

    lazy var nameProductLabel: UILabel = {
        let nameProductLabel = UILabel(frame: .zero)
        nameProductLabel.textAlignment = .left
        nameProductLabel.text = "Default Text"
        nameProductLabel.font = Luxus.Tokens.Font.montserratMedium(18)
        nameProductLabel.textColor = Luxus.Tokens.Colors.Font.lxPrimary
        nameProductLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameProductLabel
    }()

    lazy var nextPageImage: UIImageView = {
        let nextPageImage = UIImageView(frame: .zero)
        nextPageImage.image = UIImage(systemName: "chevron.right")
        nextPageImage.tintColor = Luxus.Tokens.Colors.Font.lxPrimary
        nextPageImage.translatesAutoresizingMaskIntoConstraints = false
        return nextPageImage
    }()

    override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
        backgroundColor = Luxus.Tokens.Colors.Background.lxSecondy
        layer.cornerRadius = 10
        layer.masksToBounds = true
        setup()
        setupAllConstraints()
    }
}

extension HomeProductCell {
    public func setupCell(_ tag: String, nameProduct: String, urlImage: String) {
        self.tagTitle.text = tag
        self.nameProductLabel.text = nameProduct
        productImage.networkImage(urlImage)
    }
}

extension HomeProductCell {
    private func setup() {
        addSubview(productImage)
        addSubview(tagTitle)
        addSubview(nameProductLabel)
        addSubview(nextPageImage)
    }

    private func setupAllConstraints() {
        productImageConstraints()
        tagTitleConstraints()
        nameProductLabelConstraints()
        nextPageImageConstraints()
    }
}

extension HomeProductCell {
    private func productImageConstraints() {
        NSLayoutConstraint.activate([
            productImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            productImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6),
            productImage.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6),
            productImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: frame.width * 0.03)
        ])
    }

    private func tagTitleConstraints() {
        NSLayoutConstraint.activate([
            tagTitle.bottomAnchor.constraint(equalTo: centerYAnchor),
            tagTitle.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: frame.height * 0.1),
            tagTitle.trailingAnchor.constraint(equalTo: nextPageImage.leadingAnchor, constant: frame.height * -0.2)
        ])
    }

    private func nameProductLabelConstraints() {
        NSLayoutConstraint.activate([
            nameProductLabel.topAnchor.constraint(equalTo: centerYAnchor),
            nameProductLabel.leadingAnchor.constraint(equalTo: tagTitle.leadingAnchor),
            nameProductLabel.trailingAnchor.constraint(equalTo: tagTitle.trailingAnchor)
        ])
    }

    private func nextPageImageConstraints() {
        NSLayoutConstraint.activate([
            nextPageImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            nextPageImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.22),
            nextPageImage.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.14),
            nextPageImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
}
