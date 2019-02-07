import Cartography

public extension ViewConstraintErasure where Self: ViewConstraintProtocol, Self.ViewType: UIView {
    
    // MARK: - Width
    static func width(_ width: CGFloat) -> Self {
        return Self { view in
            constrain(view) { _view in
                _view.width == width
            }
            return view
        }
    }
}
