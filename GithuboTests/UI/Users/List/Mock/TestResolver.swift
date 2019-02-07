@testable import Githubo
import Moya

class TestResolver: Resolver {
    let appResolver = AppResolver()
    
    func resolve() -> UsersListViewRouter {
        return appResolver.resolve()
    }
    
    func resolve() -> MoyaProvider<UsersAPIs> {
        return appResolver.resolve()
    }
    
    func resolve() -> FadeTransitionHandler {
        return appResolver.resolve()
    }
    
    func resolve() -> SearchRepositoriesViewRouter {
        return appResolver.resolve()
    }
    
    func resolve(outputs: SearchRepositoriesViewInputs) -> SearchRepositoriesViewPresenter {
        return appResolver.resolve(outputs: outputs)
    }
    
    func resolve(outputs: UserDetailsViewInputs) -> UserDetailsViewPresenter {
        return appResolver.resolve(outputs: outputs)
    }
    
    func resolve() -> UserDetailsViewRouter {
        return appResolver.resolve()
    }
}
