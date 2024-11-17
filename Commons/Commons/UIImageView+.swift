import UIKit

extension UIImageView {
    public func networkImage(_ urlImage: String) {
        Task {
                    if let url = URL(string: urlImage) {
                        do {
                            let (data, _) = try await URLSession.shared.data(from: url)
                            if UIImage(data: data) != nil {
                                // Atualizar a imagem na Main Thread
                                DispatchQueue.main.async {
                                    self.image? = UIImage(data: data) ?? UIImage(named: "DefaultImage")!
                                }
                            }
                        } catch {
                            print("Erro ao carregar imagem: \(error)")
                        }
                    }
                }
            }
}
