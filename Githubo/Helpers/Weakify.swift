import Foundation

//swiftlint:disable identifier_name
public func weakify<T: AnyObject>(_ owner: T, _ function: @escaping () -> Void) -> () -> Void {
    return { [weak owner] in
        return owner.map { _ in
            function()
        }
    }
}

public func weakify<T: AnyObject>(_ owner: T, _ function: Void) -> () -> Void {
    return { [weak owner] in
        return owner.map { _ in }
    }
}

public func weakify<T: AnyObject, U, S>(_ owner: T,
                                        _ function: @escaping (U) -> S) -> (U) -> S? {
    return { [weak owner] u in
        return owner.map { _ in
            return function(u)
        }
    }
}

public func weakify<T: AnyObject, U, S, V>(_ owner: T,
                                           _ function: @escaping (U, S) throws -> V) -> (U, S) throws -> V? {
    return { [weak owner] u, s in
        return try owner.map { _ in
            return try function(u, s)
        }
    }
}

public func weakify<T: AnyObject, U, S, V>(_ owner: T,
                                           _ function: @escaping (U, S) -> V) -> (U, S) -> V? {
    return { [weak owner] u, s in
        return owner.map { _ in
            return function(u, s)
        }
    }
}
