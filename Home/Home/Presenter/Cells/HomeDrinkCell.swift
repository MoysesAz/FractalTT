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
        self.contentView.addSubview(drinkImage)
    }

    private func setupAllConstraints() {
        drinkImageConstraints()
    }
}

extension HomeDrinkCell {
    private func drinkImageConstraints() {
        NSLayoutConstraint.activate([
            drinkImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            drinkImage.heightAnchor.constraint(equalTo: heightAnchor),
            drinkImage.widthAnchor.constraint(equalTo: widthAnchor),
            drinkImage.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
}
