import UIKit.UIImageView

extension UIImageView {
    static var posterImageView: UIImageView {
        let frame = CGRect(x: 0, y: 0, width: UIScreen.width, height: 500)
        let image = UIImageView(frame: frame)
        image.centerCrop()
        return image
    }
    
    static var avatarImageView: UIImageView {
        let image = UIImageView()
        image.centerCrop()
        return image
    }
}
