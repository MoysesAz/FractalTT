import Foundation
import Networking

protocol HomeViewModelProtocol {
    var cacheCollectionView: [CharactersModel] { get }
    func getAllCharacters()
}

public class HomeViewModel {
    private var network: NetworkWithCompletionProtocol
    private let endPoint: RickaAdMortyApiEndPoint
    private var _cacheCollectionView: [CharactersModel] = []

    init(network: NetworkWithCompletionProtocol = NetworkingWithCompletion(),
         endPoint: RickaAdMortyApiEndPoint =  RickaAdMortyApiEndPoint()) {
        self.network = network
        self.endPoint = endPoint
    }
}

extension HomeViewModel: HomeViewModelProtocol {
    var cacheCollectionView: [CharactersModel] { get {return self._cacheCollectionView }}

    func getAllCharacters() {
        network.handler(endPoint, responseType: [CharactersModel].self) { result in
            switch result {
            case .success(let data):
                print(data)
            case .failure(_):
                print("Error")
            }
        }
    }
}
