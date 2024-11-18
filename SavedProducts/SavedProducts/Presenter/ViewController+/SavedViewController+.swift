import UIKit

extension SavedProductsViewController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.cacheCollectionView.value?.count ?? 0
    }

    public func collectionView(_ collectionView: UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SavedProductsGalleryCell.identifier,
                                                       for: indexPath) as? SavedProductsGalleryCell else {

            return .init()
        }

        guard let product = viewModel.cacheCollectionView.value?[indexPath.row] else {
            return cell
        }

        cell.setupCell(product.tag ?? "",
                       nameProduct: product.product ?? "",
                       image: product.image ?? Data())

        return cell

    }
}

extension SavedProductsViewController: UICollectionViewDelegateFlowLayout {
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = self.view.frame
        return .init(width: size.width * 0.94, height: size.height * 0.10)
    }

    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension SavedProductsViewController: UICollectionViewDelegate {

}
