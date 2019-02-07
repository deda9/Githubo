import UIKit
import RxCocoa
import RxSwift

class SearchRepositoriesViewController: BaseViewController {
    
    var resolver: Resolver!
    var router: SearchRepositoriesViewRouter!
    var presenter: SearchRepositoriesViewPresenter!
    
    var container: RepositoryListView {
        return self.view as! RepositoryListView
    }
 
    override func loadView() {
        self.addRepositoriesListView()
        self.addSearchBarView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.router = self.resolver.resolve()
        self.presenter = self.resolver.resolve(outputs: self)
    }
    
    private func addRepositoriesListView() {
        let repoView = RepositoryListView()
        repoView.delegate = self
        self.view = repoView
    }
    
    private func addSearchBarView() {
        let searchView = SearchRepositoriesBarView()
        searchView.enableCancelButton()
        searchView.enableFirstResponder()
        
        searchView.didClickSearchButtonHandler = { [weak self] _ in
            guard let stongSelf = self else {
                return
            }
            stongSelf.router.dismissSearchUserView(from: stongSelf)
        }
        
        searchView.didSearchHandler = { [weak self] text in
            guard let stongSelf = self else {
                return
            }
            stongSelf.container.scrollTableViewToTop()
            stongSelf.presenter.searchRepositories(text)
        }
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: searchView)
    }
    
    deinit {
        debugPrint("DE-INIT \(String(describing: type(of: self))) is calling to make sure all is good")
    }
}

extension SearchRepositoriesViewController: SearchRepositoriesViewInputs {
    func onSearchingRepositories() {
        super.showLoadingView(container.tableView)
    }
    
    func onErrorSearchingRepositories() {
        super.showTryAgainErrorMessage()
    }
    
    func onSuccessSearchRepositories(_ repositories: [Repository]) {
        super.hideLoadingView(container.tableView)
        self.container.setRepository(repositories)
    }
    
    func onSuccessLoadMoreRepositories(_ repositories: [Repository]) {
        super.hideLoadingView(container.tableView)
        self.container.addRepository(repositories)
    }
}

extension SearchRepositoriesViewController: RepositoryListViewDelegate {
    func openRepositoryDetailsView(_ cell: RepositoryTableViewCell, repository: Repository) {
        self.router.openRepositoryDetailsView(repository)
    }
    
    func loadMoreRepository(_ view: RepositoryListView) {
        self.presenter.loadMoreRepositories()
    }
}
