import RxSwift

class SearchRepositoriesViewInteractor {
    private var perPage: Int = 20
    private var currentPage: Int = 1
    private var searchDebounceTime: Double = 2
    private var isLoadingMore: Bool = false
    private var searchText: String = ""
    private var disposeBag = DisposeBag()
    
    weak var outputs: SearchRepositoriesViewInteractorOutputs?
}

extension SearchRepositoriesViewInteractor: SearchRepositoriesViewInteractorInputs {
    func searchUser(_ text: String) {
        self.searchText = text
        self.searchUser(text, page: 1)
    }
    
    func loadMoreUsers() {
        guard !isLoadingMore else {
            return
        }
        self.isLoadingMore = true
        self.currentPage += 1
        searchUser(self.searchText, page: self.currentPage)
    }
    
    private func searchUser(_ text: String, page: Int) {
        self.notifySearchingRepositories()
        let searchConfig = (text: text, page: page, sort: RepositorySort.stars, order: RepositoryOrder.desc)
        
        let onErrorCallback: ((Error) -> Void)? = { error in
            weakify(self, self.onFailedSearchingRepositories)(error)
        }
        
        let onSuccessCallback: ((RepositoryResponse) -> Void)? = { response in
            weakify(self, self.onSuccessSearchingRepositories)(response)
        }
        
        repositoriesProvider
            .rx.request(.search(searchConfig))
            .map(RepositoryResponse.self)
            .subscribe(onSuccess: onSuccessCallback, onError: onErrorCallback)
            .disposed(by: disposeBag)
    }
    
    private func notifySearchingRepositories() {
        self.outputs?.onSearchingRepositories()
    }
    
    private func onSuccessSearchingRepositories(_ response: RepositoryResponse) {
        if self.isLoadingMore {
            self.outputs?.onSuccessLoadMoreRepositories(response.repositoriesList)
            self.isLoadingMore = false
        } else {
            self.outputs?.onSuccessSearchRepositories(response.repositoriesList)
        }
    }
    
    private func onFailedSearchingRepositories(_ error: Error) {
        self.outputs?.onErrorSearchingRepositories()
        self.isLoadingMore = false
    }
}
