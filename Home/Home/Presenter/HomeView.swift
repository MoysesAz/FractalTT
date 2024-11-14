import UIKit

public protocol HomeViewProtocol {
}

final public class HomeView: UIView {
    public override init(frame: CGRect) {
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func willMove(toWindow newWindow: UIWindow?) {
        backgroundColor = .systemPink
    }
}

extension HomeView: HomeViewProtocol {

}
