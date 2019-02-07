import Cartography

public extension ViewConstraintErasure where Self: ViewConstraintProtocol, Self.ViewType: UIView {
    
    // MARK: - Top of
    static func top(of parent: UIView, offset: CGFloat, applySafeArea: Bool = true) -> Self {
        return Self { view in
            constrain(view, parent) { _view, parent in
                if applySafeArea {
                    if #available(iOS 11.0, *) {
                        _view.top == parent.safeAreaLayoutGuide.top + offset
                    } else {
                        _view.top == parent.top + offset
                    }
                } else {
                    _view.top == parent.top + offset
                }
            }
            return view
        }
    }
    
    static func top(of parent: UIView, applySafeArea: Bool) -> Self {
        return top(of: parent, offset: 0, applySafeArea: applySafeArea)
    }
}
