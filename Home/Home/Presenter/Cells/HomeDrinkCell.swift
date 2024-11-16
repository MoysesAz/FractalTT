import UIKit
import DesignSystem

class HomeDrinkCell: UITableViewCell {
    static let identifier = "HomeDrinkCell"

    lazy var drinkImage: UIImageView = {
        let drinkImage = UIImageView(frame: .zero)
        drinkImage.image = UIImage(named: "Images/Bottle")
        drinkImage.translatesAutoresizingMaskIntoConstraints = false
        return drinkImage
    }()

    override func willMove(toWindow newWindow: UIWindow?) {
        super.willMove(toWindow: newWindow)
        backgroundColor = .clear
        contentView.layer.backgroundColor = Luxus.Tokens.Colors.Background.lxSecondy.cgColor
        contentView.layer.borderWidth = 1.5
        contentView.layer.cornerRadius = 12
        contentView.layer.borderColor = Luxus.Tokens.Colors.Background.lxSecondy.cgColor
        setup()
        setupAllConstraints()
    }
}

extension HomeDrinkCell {
    private func setup() {
        addSubview(drinkImage)
    }

    private func setupAllConstraints() {
        drinkImageConstraints()
    }
}

extension HomeDrinkCell {
    private func drinkImageConstraints() {
        NSLayoutConstraint.activate([
            drinkImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            drinkImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6),
            drinkImage.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6),
            drinkImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ])
    }
}
