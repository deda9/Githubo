protocol UsersListViewInputs: AnyObject {
    func onLoadingUsers()
    func onErrorLoadingUsers()
    func onSuccessLoadUsers(_ users: [User])
}
