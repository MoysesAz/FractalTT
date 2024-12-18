import Foundation
import Networking
import Commons

protocol HomeViewModelProtocol {
    func getAllCharacters()
    var cacheCollectionView: BindableObject<[ProductsModel]?> { get set }
    var filterCollectionView: BindableObject<[ProductsModel]> { get set }
}

public class HomeViewModel {
    private var network: NetworkWithCompletionProtocol
    private let endPoint: RickaAdMortyApiEndPoint
    public var cacheCollectionView: BindableObject<[ProductsModel]?> = BindableObject(nil)
    public var filterCollectionView: BindableObject<[ProductsModel]> = BindableObject([])

    init(network: NetworkWithCompletionProtocol = NetworkingWithCompletion(),
         endPoint: RickaAdMortyApiEndPoint =  RickaAdMortyApiEndPoint()) {
        self.network = network
        self.endPoint = endPoint
    }
}

extension HomeViewModel: HomeViewModelProtocol {
    func getAllCharacters() {
        network.handler(endPoint, responseType: AllProductsModel.self) { result in
            switch result {
            case .success(let data):
                if self.cacheCollectionView.value == nil {
                    self.cacheCollectionView.value = data.results
                    self.filterCollectionView.value = self.cacheCollectionView.value!
                    guard let next = data.info.next else {
                        return
                    }
                    self.endPoint.baseUrl = next
                    self.endPoint.path = ""
                    return
                }

                self.cacheCollectionView.value! += data.results
                self.filterCollectionView.value = self.cacheCollectionView.value!

                guard let next = data.info.next else {
                    return
                }
                self.endPoint.baseUrl = next
                self.endPoint.path = ""
                return
            case .failure:
                print("Error")
            }
        }
    }
}
