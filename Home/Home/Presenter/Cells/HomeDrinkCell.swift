import UIKit
import DesignSystem

class HomeDrinkCell: UICollectionViewCell {
    static let identifier = "HomeDrinkCell"

    lazy var drinkImage: UIImageView = {
        let drinkImage = UIImageView(frame: .zero)
        drinkImage.image = UIImage(named: "DefaultImage")
        drinkImage.translatesAutoresizingMaskIntoConstraints = false
        return drinkImage
    }()

    lazy var title: UILabel = {
        let title = UILabel(frame: .zero)
        title.textAlignment = .left
        title.text = "Default Text"
        title.font = UIFont.systemFont(ofSize: 18)
        title.textColor = Luxus.Tokens.Colors.Font.lxPrimary
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel(frame: .zero)
        descriptionLabel.textAlignment = .left
        descriptionLabel.text = "Default Text"
        descriptionLabel.font = UIFont.systemFont(ofSize: 18)
        descriptionLabel.textColor = Luxus.Tokens.Colors.Font.lxPrimary
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return descriptionLabel
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

extension HomeDrinkCell {
    private func setup() {
        addSubview(drinkImage)
        addSubview(title)
        addSubview(descriptionLabel)
        addSubview(nextPageImage)
    }

    private func setupAllConstraints() {
        drinkImageConstraints()
        titleConstraints()
        descriptionLabelConstraints()
        nextPageImageConstraints()
    }
}

extension HomeDrinkCell {
    private func drinkImageConstraints() {
        NSLayoutConstraint.activate([
            drinkImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            drinkImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6),
            drinkImage.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6),
            drinkImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: frame.width * 0.03)
        ])
    }

    private func titleConstraints() {
        NSLayoutConstraint.activate([
            title.bottomAnchor.constraint(equalTo: centerYAnchor),
            title.leadingAnchor.constraint(equalTo: drinkImage.trailingAnchor, constant: frame.height * 0.1),
            title.trailingAnchor.constraint(equalTo: nextPageImage.leadingAnchor, constant: frame.height * -0.2)
        ])
    }

    private func descriptionLabelConstraints() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: centerYAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: title.trailingAnchor)
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
