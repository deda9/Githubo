
@testable import Githubo

class UsersListViewInteractorMock: UsersListViewInteractor {
    var users: [User] = []
    
    override func loadUsers() {
        self.outputs?.onLoadingUsers()
        self.users = getUsersList()
        self.outputs?.onSuccessLoadUsers(self.users)
    }
    
    override func loadMoreUsers() {
        self.outputs?.onLoadingUsers()
        self.users += getUsersList()
        self.outputs?.onSuccessLoadUsers(self.users)
    }
    
    private func getUsersList() -> [User] {
        let data = JSONMock.users.data
        let users = JSONHelper.parseData(of: [User].self, from: data)
        return users
    }
}
