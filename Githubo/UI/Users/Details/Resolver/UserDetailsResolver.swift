
protocol UserDetailsResolver {
    func resolve(outputs: UserDetailsViewInputs) -> UserDetailsViewPresenter
    func resolve() -> UserDetailsViewRouter
}

extension UserDetailsResolver where Self: AppResolver {
    func resolve(outputs: UserDetailsViewInputs) -> UserDetailsViewPresenter {
        let presenter = UserDetailsViewPresenter()
        let interactor = UserDetailsViewInteractor()
        interactor.usersNetworkProvider = resolve()
        presenter.interactor = interactor
        presenter.outputs = outputs
        interactor.outputs = presenter
        return presenter
    }
    
    func resolve() -> UserDetailsViewRouter {
        return UserDetailsViewRouter()
    }
}
