import UIKit.UIView

public extension UIView {
    func setConstraint(_ constraint: ViewConstraint) {
        _ = constraint.constraint(self)
    }
}
