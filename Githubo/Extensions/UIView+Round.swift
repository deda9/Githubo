import UIKit.UIView

extension UIView {
    func round(by value: CGFloat) {
        self.layer.cornerRadius = value
        self.clipsToBounds = true
    }
    
    func circle() {
        let raduis = self.bounds.width / 2
        self.round(by: raduis)
    }
    
    public func centerCrop() {
        contentMode = .scaleAspectFill
        clipsToBounds = true
    }
}
