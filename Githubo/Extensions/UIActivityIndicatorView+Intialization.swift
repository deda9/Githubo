import UIKit.UIActivityIndicatorView

extension UIActivityIndicatorView {
    static var loading: UIActivityIndicatorView {
        let loading = UIActivityIndicatorView(frame: CGRect(origin: .zero, size: CGSize(width: 40, height: 40)))
        loading.color = UIColor.red
        loading.sizeToFit()
        return loading
    }
}
