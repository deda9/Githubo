protocol UserDetailsViewInteractorOutputs: AnyObject {
    func onLoadingUserDetails()
    func onErrorLoadingUserDetails()
    func onSuccessLoadUserDetails(_ user: User)
}
