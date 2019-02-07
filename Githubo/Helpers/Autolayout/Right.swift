import Cartography

public extension ViewConstraintErasure where Self: ViewConstraintProtocol, Self.ViewType: UIView {
    
    // MARK: - Right of
    static func right(of parent: UIView, offset: CGFloat) -> Self {
        return Self { view in
            constrain(view, parent) { _view, parent in
                _view.right == parent.right + offset
            }
            return view
        }
    }
    
    static func right(of parent: UIView) -> Self {
        return right(of: parent, offset: 0)
    }
}
