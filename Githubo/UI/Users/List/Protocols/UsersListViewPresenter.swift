import Foundation

class UsersListViewPresenter {
    var interactor: UsersListViewInteractorInputs!
    weak var outputs: UsersListViewInputs?
}

extension UsersListViewPresenter: UsersListViewPresenterInputs {
    @objc func viewDidLoad() {
        self.interactor.loadUsers()
    }
    
    func loadMoreUsers() {
        self.interactor.loadMoreUsers()
    }
}

extension UsersListViewPresenter: UsersListViewInteractorOutputs {
    func onLoadingUsers() {
        self.outputs?.onLoadingUsers()
    }
    
    func onErrorLoadingUsers() {
        self.outputs?.onErrorLoadingUsers()
    }
    
    func onSuccessLoadUsers(_ users: [User]) {
        self.outputs?.onSuccessLoadUsers(users)
    }
}
