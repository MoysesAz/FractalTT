import UIKit
import DesignSystem
import Commons

public protocol ProductDetailsViewProtocol {
    func setupDetails(_ tagTile: String, nameProduct: String, descriptionText: String, urlImage: String)
}

final public class ProductDetailsView: UIView {
    lazy var imageProduct: UIImageView = {
        let searchIcon = UIImageView(frame: .zero)
        var image = UIImage(named: "DefaultImage")
        searchIcon.image = UIImage(named: "DefaultImage")
        searchIcon.translatesAutoresizingMaskIntoConstraints = false
        searchIcon.makeRounded(10)
        return searchIcon
    }()

    lazy var tagTitle: UILabel = {
        let tagTitle = UILabel(frame: .zero)
        tagTitle.textAlignment = .left
        tagTitle.text = "No result were found"
        tagTitle.font = UIFont.systemFont(ofSize: 18)
        tagTitle.textColor = Luxus.Tokens.Colors.Font.lxPrimary
        tagTitle.translatesAutoresizingMaskIntoConstraints = false
        return tagTitle
    }()

    lazy var nameProduct: UILabel = {
        let nameProduct = UILabel(frame: .zero)
        nameProduct.textAlignment = .left
        nameProduct.text = "No result were found"
        nameProduct.font = UIFont.systemFont(ofSize: 18)
        nameProduct.textColor = Luxus.Tokens.Colors.Font.lxPrimary
        nameProduct.translatesAutoresizingMaskIntoConstraints = false
        return nameProduct
    }()

    lazy var descriptionLabel: UITextView = {
        let descriptionLabel = UITextView(frame: .zero)
        descriptionLabel.textAlignment = .left
        descriptionLabel.text = "No result were found"
        descriptionLabel.font = UIFont.systemFont(ofSize: 18)
        descriptionLabel.textColor = Luxus.Tokens.Colors.Font.lxPrimary
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return descriptionLabel
    }()

    lazy var saveButton: UIButton = {
        let heartButton = UIButton(frame: .zero)
        heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        heartButton.tintColor = .gray
        heartButton.translatesAutoresizingMaskIntoConstraints = false
        return heartButton
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

extension ProductDetailsView: ProductDetailsViewProtocol {
    public func setupDetails(_ tagTile: String, nameProduct: String, descriptionText: String, urlImage: String) {

        let loremIpsom = """
                  Lorem Ipsum is simply dummy text of the printing and typesetting industry.
        Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,
        when an unknown printer took a galley of type and scrambled it to make a type specimen book.
        It has survived not only five centuries, but also the leap into electronic typesetting,
        remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset
        sheets containing Lorem Ipsum passages,
        and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
        """

        DispatchQueue.main.async {
            self.tagTitle.text = tagTile
            self.nameProduct.text = nameProduct
            self.descriptionLabel.text = descriptionText + loremIpsom
        }
        imageProduct.networkImage(urlImage)
    }
}

extension ProductDetailsView {
    private func setup() {
        addSubview(imageProduct)
        addSubview(saveButton)
        addSubview(tagTitle)
        addSubview(nameProduct)
        addSubview(descriptionLabel)
    }

    private func setupAllConstraints() {
        imageProductConstraints()
        saveButtonConstraints()
        tagTitleConstraints()
        nameProductConstraints()
        descriptionLabelConstraints()
    }
}

extension ProductDetailsView {
    private func imageProductConstraints() {
        NSLayoutConstraint.activate([
            imageProduct.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1),
            imageProduct.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1),
            imageProduct.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            imageProduct.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ])
    }

    private func saveButtonConstraints() {
        NSLayoutConstraint.activate([
            saveButton.centerYAnchor.constraint(equalTo: imageProduct.centerYAnchor),
            saveButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05),
            saveButton.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05),
            saveButton.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    private func tagTitleConstraints() {
        NSLayoutConstraint.activate([
            tagTitle.bottomAnchor.constraint(equalTo: imageProduct.centerYAnchor),
            tagTitle.leadingAnchor.constraint(equalTo: imageProduct.trailingAnchor, constant: 10),
            tagTitle.trailingAnchor.constraint(equalTo: saveButton.leadingAnchor, constant: -10)
        ])
    }

    private func nameProductConstraints() {
        NSLayoutConstraint.activate([
            nameProduct.topAnchor.constraint(equalTo: tagTitle.bottomAnchor, constant: 10),
            nameProduct.leadingAnchor.constraint(equalTo: tagTitle.leadingAnchor),
            nameProduct.trailingAnchor.constraint(equalTo: tagTitle.trailingAnchor)
        ])
    }

    private func descriptionLabelConstraints() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: imageProduct.bottomAnchor, constant: 40),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
}