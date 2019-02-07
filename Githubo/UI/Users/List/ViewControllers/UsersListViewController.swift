import UIKit

class UsersListViewController: BaseViewController {
    
    var resolver: Resolver!
    var presenter: UsersListViewPresenterInputs!
    var router: UsersListViewRouter!
    var searchTransition: FadeTransitionHandler!
    
    var container: UsersListView {
        return self.view as! UsersListView
    }
    
    override func loadView() {
        self.addUsersListView()
        self.addSearchBarView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchTransition = self.resolver.resolve()
        self.presenter = self.resolver.resolve(outputs: self)
        self.router = self.resolver.resolve()
        self.presenter.viewDidLoad()
    }
    
    private func addUsersListView() {
        let usersView = UsersListView()
        usersView.delegate = self
        self.view = usersView
    }
    
    private func addSearchBarView() {
        let searchView = SearchRepositoriesBarView()
        searchView.setupOnClickListener()
        searchView.delegate = self
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: searchView)
    }
}

extension UsersListViewController: UsersListViewInputs {
    func onLoadingUsers() {
        super.showLoadingView(container.tableView)
    }
    
    func onErrorLoadingUsers() {
        super.showTryAgainErrorMessage()
    }
    
    func onSuccessLoadUsers(_ users: [User]) {
        super.hideLoadingView(container.tableView)
        self.container.addUsers(users)
    }
}

extension UsersListViewController: UsersListViewDelegate {
    func loadMoreUsers(_ view: UsersListView) {
        self.presenter.loadMoreUsers()
    }
    
    func openUserDetailsView(_ cell: UserTableViewCell, user: User) {
        let configuration = ZoomTransitionConfiguration { config in
            config.imageView = cell.userAvatarImageView
        }
        self.router.openUserDetailsView(from: self, user: user, resolver: self.resolver, configuration: configuration)
    }
}

extension UsersListViewController: UISearchBarDelegate {
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.router.openSearchRepositoriesView(from: self, resolver: self.resolver, transition: searchTransition)
    }
}
