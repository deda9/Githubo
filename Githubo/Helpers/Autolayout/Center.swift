import Cartography

public extension ViewConstraintErasure where Self: ViewConstraintProtocol, Self.ViewType: UIView {
    
    // MARK: - Center
    static func center(in parent: UIView) -> Self {
        return Self { view in
            constrain(view, parent) { _view, parent in
                _view.center == parent.center
            }
            return view
        }
    }
    
    // MARK: - CenterX
    static func centerX(in parent: UIView, offset: CGFloat) -> Self {
        return Self { view in
            constrain(view, parent) { _view, parent in
                _view.centerX == parent.centerX + offset
            }
            return view
        }
    }
    
    static func centerX(in parent: UIView) -> Self {
        return centerX(in: parent, offset: 0)
    }
    
    // MARK: - CenterY
    static func centerY(in parent: UIView, offset: CGFloat) -> Self {
        return Self { view in
            constrain(view, parent) { _view, parent in
                _view.centerY == parent.centerY + offset
            }
            return view
        }
    }
    
    static func centerY(in parent: UIView) -> Self {
        return centerY(in: parent, offset: 0)
    }
}
