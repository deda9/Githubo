protocol SearchRepositoriesViewInputs: class {
    func onSearchingRepositories()
    func onErrorSearchingRepositories()
    func onSuccessSearchRepositories(_ repositories: [Repository])
    func onSuccessLoadMoreRepositories(_ repositories: [Repository])
}
