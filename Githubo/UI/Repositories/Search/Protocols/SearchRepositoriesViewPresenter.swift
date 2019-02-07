class SearchRepositoriesViewPresenter {
    var interactor: SearchRepositoriesViewInteractorInputs!
    weak var outputs: SearchRepositoriesViewInputs?
}

extension SearchRepositoriesViewPresenter: SearchRepositoriesViewPresenterInputs {
    func loadMoreRepositories() {
        self.interactor.loadMoreUsers()
    }
    
    func searchRepositories(_ text: String) {
        self.interactor.searchUser(text)
    }
}

extension SearchRepositoriesViewPresenter: SearchRepositoriesViewInteractorOutputs {
    func onSuccessLoadMoreRepositories(_ repositories: [Repository]) {
        self.outputs?.onSuccessLoadMoreRepositories(repositories)
    }
    
    func onSearchingRepositories() {
        self.outputs?.onSearchingRepositories()
    }
    
    func onErrorSearchingRepositories() {
        self.outputs?.onErrorSearchingRepositories()
    }
    
    func onSuccessSearchRepositories(_ repositories: [Repository]) {
        self.outputs?.onSuccessSearchRepositories(repositories)
    }
}
