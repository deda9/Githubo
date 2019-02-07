
public protocol ViewConstraintProtocol {

    associatedtype ViewType
    
    typealias Constraint = (ViewType) -> ViewType
    
    var constraint: Constraint { get }
    
    init(constraint: @escaping Constraint)
}

public func +<View: ViewConstraintProtocol>(lhs: View, rhs: View) -> View {
    return View { view in
        return rhs.constraint(lhs.constraint(view))
    }
}
