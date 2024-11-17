import UIKit

extension HomeViewController: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.filterCollectionView.value.count
    }

    public func collectionView(_ collectionView: UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeProductCell.identifier,
                                                       for: indexPath) as? HomeProductCell else {

            return .init()
        }

        let character = viewModel.filterCollectionView.value[indexPath.row]
        cell.setupCell(character.name, description: character.status, urlImage: character.image)

        return cell

    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
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

extension HomeViewController: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let character = viewModel.filterCollectionView.value[indexPath.row]
        showDetailsView(character)
    }

    public func collectionView(_ collectionView: UICollectionView,
                               willDisplay cell: UICollectionViewCell,
                               forItemAt indexPath: IndexPath) {

        if searchController.searchBar.text != "" {
            return
        }

        if indexPath.row == collectionView.numberOfItems(inSection: indexPath.section) - 1 {
            viewModel.getAllCharacters()
        }
    }
}

extension HomeViewController: UISearchResultsUpdating {
    public func updateSearchResults(for searchController: UISearchController) {
        guard let cacheCollection = viewModel.cacheCollectionView.value else { return }

        let searchText = searchController.searchBar.text?.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""

        if searchText.isEmpty {
            viewModel.filterCollectionView.value = cacheCollection
        } else {
            viewModel.filterCollectionView.value = cacheCollection.filter {
                $0.name.localizedCaseInsensitiveContains(searchText)
            }

            if viewModel.filterCollectionView.value.isEmpty {
                contentView.emptySearchViewOn()
            } else {
                contentView.emptySearchViewOff()
            }
        }
    }
}
