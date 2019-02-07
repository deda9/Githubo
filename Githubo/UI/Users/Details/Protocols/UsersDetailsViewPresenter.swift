import Foundation

class UserDetailsViewPresenter {
    weak var outputs: UserDetailsViewInputs?
    var interactor: UsersDetailsViewInteractorInputs!
}

extension UserDetailsViewPresenter: UserDetailsViewPresenterInputs {
    func loadUserDetails(userName: String) {
        self.interactor.loadUserDetails(userName)
    }
}

extension UserDetailsViewPresenter: UserDetailsViewInteractorOutputs {
    func onLoadingUserDetails() {
        self.outputs?.onLoadingUserDetails()
    }
    
    func onErrorLoadingUserDetails() {
        self.outputs?.onErrorLoadingUserDetails()
    }
    
    func onSuccessLoadUserDetails(_ user: User) {
        var user = user
        user.name = user.name?.localizedCapitalized
        self.outputs?.onSuccessLoadUserDetails(user)
    }
}
