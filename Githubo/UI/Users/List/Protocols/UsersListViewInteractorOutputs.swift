protocol UsersListViewInteractorOutputs: AnyObject {
    func onLoadingUsers()
    func onErrorLoadingUsers()
    func onSuccessLoadUsers(_ users: [User])
}
