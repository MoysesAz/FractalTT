import UIKit

extension HomeViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeDrinkCell.identifier,
                                                       for: indexPath) as? HomeDrinkCell else {
            fatalError()
        }
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {

}
