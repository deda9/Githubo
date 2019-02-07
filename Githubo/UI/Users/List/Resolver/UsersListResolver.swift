import Moya

protocol UsersListResolver {
    func resolve() -> UsersListViewRouter
    func resolve() -> MoyaProvider<UsersAPIs>
    func resolve(outputs: UsersListViewInputs) -> UsersListViewPresenter
}

extension UsersListResolver where Self: AppResolver {
    
    func resolve() -> UsersListViewRouter {
        return UsersListViewRouter()
    }
    
    func resolve(outputs: UsersListViewInputs) -> UsersListViewPresenter {
        let presenter = UsersListViewPresenter()
        let interactor = UsersListViewInteractor()
        interactor.usersNetworkProvider = resolve()
        interactor.outputs = presenter
        presenter.interactor = interactor
        presenter.outputs = outputs
        return presenter
    }
    
    func resolve() -> MoyaProvider<UsersAPIs> {
        let plugins = AppEnvironement.showLog ? [NetworkLoggerPlugin(verbose: true)] : []
        let usersProvider = MoyaProvider<UsersAPIs>(plugins: plugins)
        return usersProvider
    }
}
