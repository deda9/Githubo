import Cartography

public extension ViewConstraintErasure where Self: ViewConstraintProtocol, Self.ViewType: UIView {
    
    // MARK: - This view left = parent right
    static func left(rightOf parent: UIView, offset: CGFloat) -> Self {
        return Self { view in
            constrain(view, parent) { _view, parent in
                _view.left == parent.right + offset
            }
            return view
        }
    }
    
    static func leftRight(of parent: UIView) -> Self {
        return left(rightOf: parent, offset: 0)
    }
}
