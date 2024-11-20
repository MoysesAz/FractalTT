import UIKit
extension UIImageView {
    private static let imageCache = NSCache<NSString, UIImage>()

    public func networkImage(_ urlImage: String) {
        let cacheKey = NSString(string: urlImage)
        self.image = UIImage(named: "DefaultImage")

        if let cachedImage = UIImageView.imageCache.object(forKey: cacheKey) {
            Log.message("Image already exists in cache with key: \(urlImage)", .success)
            self.image = cachedImage
            return
        }

        Task {
            if let url = URL(string: urlImage) {
                do {
                    let (data, _) = try await URLSession.shared.data(from: url)
                    if let image = UIImage(data: data) {
                        UIImageView.imageCache.setObject(image, forKey: cacheKey)
                        Log.message("url: \(urlImage) returned a image", .success)

                        DispatchQueue.main.async {
                            self.image = image
                        }
                    } else {
                        Log.message("Data is not an image", .failure)
                    }
                } catch {
                    Log.message(error.localizedDescription, .failure)
                }
            }
        }
    }
}
