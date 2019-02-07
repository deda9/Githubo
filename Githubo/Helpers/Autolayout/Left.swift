import Cartography

public extension ViewConstraintErasure where Self: ViewConstraintProtocol, Self.ViewType: UIView {
    
    // MARK: - Left of
    static func left(of parent: UIView, offset: CGFloat) -> Self {
        return Self { view in
            constrain(view, parent) { _view, parent in
                _view.left == parent.left + offset
            }
            return view
        }
    }
    
    static func left(of parent: UIView) -> Self {
        return left(of: parent, offset: 0)
    }
}
