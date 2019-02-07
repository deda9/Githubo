import UIKit

protocol RepositoriesListResolver {
    func resolve() -> FadeTransitionHandler
    func resolve() -> SearchRepositoriesViewRouter
    func resolve(outputs: SearchRepositoriesViewInputs) -> SearchRepositoriesViewPresenter
}

extension RepositoriesListResolver where Self: AppResolver {
    func resolve() -> FadeTransitionHandler {
        let transition = FadeTransitionHandler()
        return transition
    }
    
    func resolve() -> SearchRepositoriesViewRouter {
        return SearchRepositoriesViewRouter()
    }
    
    func resolve(outputs: SearchRepositoriesViewInputs) -> SearchRepositoriesViewPresenter {
        let presenter = SearchRepositoriesViewPresenter()
        let interactor = SearchRepositoriesViewInteractor()
        presenter.interactor = interactor
        interactor.outputs = presenter
        presenter.outputs = outputs
        return presenter
    }
}
