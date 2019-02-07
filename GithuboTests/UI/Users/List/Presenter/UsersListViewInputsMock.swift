@testable import Githubo

class UsersListViewInputsMock: UsersListViewInputs {
    
    var isLoading: Bool = false
    var isLoaded: Bool = false
    var isError: Bool = false
    var users: [User] = []
    
    func onLoadingUsers() {
        self.isLoading = true
        self.isError = false
        self.isLoaded = false
    }
    
    func onErrorLoadingUsers() {
        self.isError = true
        self.isLoading = false
        self.isLoaded = false
    }
    
    func onSuccessLoadUsers(_ users: [User]) {
        self.isError = false
        self.isLoading = false
        self.isLoaded = true
        self.users = users
    }
}
