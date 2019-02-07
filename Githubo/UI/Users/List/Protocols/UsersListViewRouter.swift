import UIKit.UINavigationController
import UIKit.UIViewController

class UsersListViewRouter {

    func openUserDetailsView(from parent: UIViewController, user: User, resolver: Resolver, configuration: ZoomTransitionConfiguration) {
        let view = UserDetailsViewController(user, configuration: configuration)
        view.resolver = resolver
        parent.present(view, animated: true, completion: nil)
    }
    
    func openSearchRepositoriesView(from parent: UIViewController, resolver: Resolver, transition: TransitionHandler) {
        let view = SearchRepositoriesViewController()
        let nav = UINavigationController()
        nav.transitioningDelegate = transition
        nav.modalPresentationStyle = .custom
        nav.viewControllers = [view]
        view.resolver = resolver
        parent.present(nav, animated: true, completion: nil)
    }
}
