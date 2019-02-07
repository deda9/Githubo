import Foundation
import RxSwift
import Alamofire
import Moya

class UsersListViewInteractor {
    
    weak var outputs: UsersListViewInteractorOutputs?
    
    var usersNetworkProvider: MoyaProvider<UsersAPIs>!
    
    private let perPage: Int = 20
    private var lastUserID: Int = 0
    private var isLoadingMore: Bool = false
    private var disposeBag = DisposeBag()
}

extension UsersListViewInteractor: UsersListViewInteractorInputs {
    @objc func loadUsers() {
        loadUsers(perPage: self.perPage, lastUserID: 0)
    }
    
    @objc func loadMoreUsers() {
        guard !isLoadingMore else {
            return
        }
        self.isLoadingMore = true
        loadUsers(perPage: self.perPage, lastUserID: self.lastUserID)
    }
    
    private func loadUsers(perPage: Int, lastUserID: Int) {
        self.notifyLoadingPopularRepositories()
        
        let onErrorCallback: ((Error) -> Void)? = { error in
            weakify(self, self.onFailedLoadUsers(error))()
        }
        
        let onSuccessCallback: (([User]) -> Void)? = { usersList in
            weakify(self, self.onSuccessLoadUsers(usersList))()
        }
        
        usersNetworkProvider
            .rx.request(.usersList(lastUserID, perPage))
            .map([User].self)
            .subscribe(onSuccess: onSuccessCallback, onError: onErrorCallback)
            .disposed(by: disposeBag)
    }
    
    private func notifyLoadingPopularRepositories() {
        self.outputs?.onLoadingUsers()
    }
    
    private func onSuccessLoadUsers(_ users: [User]) {
        self.outputs?.onSuccessLoadUsers(users)
        self.isLoadingMore = false
        self.lastUserID = users.last?.id ?? 0
    }
    
    private func onFailedLoadUsers(_ error: Error) {
        self.outputs?.onErrorLoadingUsers()
        self.isLoadingMore = false
    }
}
