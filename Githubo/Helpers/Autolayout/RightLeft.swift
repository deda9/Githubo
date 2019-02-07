import Cartography

public extension ViewConstraintErasure where Self: ViewConstraintProtocol, Self.ViewType: UIView {
    
    // MARK: - This view right = parent left
    static func right(leftOf parent: UIView, offset: CGFloat) -> Self {
        return Self { view in
            constrain(view, parent) { _view, parent in
                _view.right == parent.left + offset
            }
            return view
        }
    }
    
    static func rightLeft(of parent: UIView) -> Self {
        return right(leftOf: parent, offset: 0)
    }
}
