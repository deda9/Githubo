import Kingfisher

extension UIImageView {
    func download(url: String?, placeholder: UIImage?) {
        
        self.image = placeholder
        
        guard let urlString = url else {
            return
        }
        
        let url = URL(string: urlString)
        self.kf.setImage(with: url)
    }
}
