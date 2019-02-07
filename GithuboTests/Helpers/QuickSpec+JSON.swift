import Quick

@testable import Githubo
extension QuickSpec {
    
    class Test {}
    
    func getUsersList() -> [User] {
        let data = JSONMock.users.data
        return JSONHelper.parseData(of: [User].self, from: data)
    }
    
    func getFirstUser() -> User {
        let users = self.getUsersList()
        guard !users.isEmpty else {
            fatalError("Cant get the first User while getting the users list for testing")
        }
        return users[0]
    }
}
