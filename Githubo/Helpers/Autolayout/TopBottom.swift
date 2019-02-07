import Cartography

public extension ViewConstraintErasure where Self: ViewConstraintProtocol, Self.ViewType: UIView {
    
    // MARK: - This view Top = parent Bottom
    static func top(bottomOf parent: UIView, offset: CGFloat) -> Self {
        return Self { view in
            constrain(view, parent) { _view, parent in
                _view.top == parent.bottom + offset
            }
            return view
        }
    }
    
    static func topBottom(of parent: UIView) -> Self {
        return top(bottomOf: parent, offset: 0)
    }
}
