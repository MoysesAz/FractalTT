import UIKit
import DesignSystem

class SavedProductsGalleryCell: UICollectionViewCell {
    static let identifier = "SavedProductsGalleryCell"

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

    override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
        backgroundColor = Luxus.Tokens.Colors.Background.lxSecondy
        layer.cornerRadius = 10
        layer.masksToBounds = true
        setup()
        setupAllConstraints()
    }
}

extension SavedProductsGalleryCell {
    public func setupCell(_ tag: String, nameProduct: String, image: Data) {
        DispatchQueue.main.async {
            self.tagTitle.text = tag
            self.nameProductLabel.text = nameProduct
            self.productImage.image = UIImage(data: image)
        }
    }
}

extension SavedProductsGalleryCell {
    private func setup() {
        addSubview(productImage)
        addSubview(tagTitle)
        addSubview(nameProductLabel)
    }

    private func setupAllConstraints() {
        productImageConstraints()
        tagTitleConstraints()
        nameProductLabelConstraints()
    }
}

extension SavedProductsGalleryCell {
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
            tagTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: frame.height * -0.4)
        ])
    }

    private func nameProductLabelConstraints() {
        NSLayoutConstraint.activate([
            nameProductLabel.topAnchor.constraint(equalTo: centerYAnchor),
            nameProductLabel.leadingAnchor.constraint(equalTo: tagTitle.leadingAnchor),
            nameProductLabel.trailingAnchor.constraint(equalTo: tagTitle.trailingAnchor)
        ])
    }
}
