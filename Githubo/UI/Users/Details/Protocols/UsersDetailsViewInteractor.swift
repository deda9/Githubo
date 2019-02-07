import Foundation
import RxSwift
import Alamofire
import Moya

class UserDetailsViewInteractor {
    
    weak var outputs: UserDetailsViewInteractorOutputs?

    var usersNetworkProvider: MoyaProvider<UsersAPIs>!

    private let perPage: Int = 20
    private var lastUserID: Int = 0
    private var isLoadingMore: Bool = false
    private var disposeBag = DisposeBag()
}

extension UserDetailsViewInteractor: UsersDetailsViewInteractorInputs {
    func loadUserDetails(_ userName: String) {
        self.notifyLoadingUserDetails()
        
        let onErrorCallback: ((Error) -> Void)? = { error in
            weakify(self, self.onFailedLoadUserDetails(error))()
        }
        
        let onSuccessCallback: ((User) -> Void)? = { userDetails in
            weakify(self, self.onSuccessLoadUserDetails(userDetails))()
        }
        
        usersNetworkProvider
            .rx.request(.userDetails(userName))
            .map(User.self)
            .subscribe(onSuccess: onSuccessCallback, onError: onErrorCallback)
            .disposed(by: disposeBag)
    }
    
    private func notifyLoadingUserDetails() {
        self.outputs?.onLoadingUserDetails()
    }
    
    private func onSuccessLoadUserDetails(_ user: User) {
        self.outputs?.onSuccessLoadUserDetails(user)
    }
    
    private func onFailedLoadUserDetails(_ error: Error) {
        self.outputs?.onErrorLoadingUserDetails()
    }
}
