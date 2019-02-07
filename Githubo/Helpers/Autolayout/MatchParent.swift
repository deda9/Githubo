import Cartography

public extension ViewConstraintErasure where Self: ViewConstraintProtocol, Self.ViewType: UIView {
    
    // MARK: - Bottom of
    static func matchParent(_ parent: UIView) -> Self {
        return Self { view in
            constrain(view, parent) { _view, parent in
                _view.edges == parent.edges
            }
            return view
        }
    }
}
