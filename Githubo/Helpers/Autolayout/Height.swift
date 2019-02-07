import Cartography

public extension ViewConstraintErasure where Self: ViewConstraintProtocol, Self.ViewType: UIView {
    
    // MARK: - Height
    static func height(_ height: CGFloat) -> Self {
        return Self { view in
            constrain(view) { _view in
                _view.height == height
            }
            return view
        }
    }
}
