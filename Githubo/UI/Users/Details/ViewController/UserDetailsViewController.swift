import UIKit

class UserDetailsViewController: BaseViewController {
    
    private var userName: String!
    private var configuration: ZoomTransitionConfiguration!
    private var transitionHandler: ZoomTransitionHandler!
    private var loadingView: UIActivityIndicatorView = UIActivityIndicatorView.loading
    
    var resolver: Resolver!
    var presenter: UserDetailsViewPresenterInputs!
    var router: UserDetailsViewRouter!
    
    var container: UserDetailsView {
        return self.view as! UserDetailsView
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(_ user: User, configuration: ZoomTransitionConfiguration) {
        super.init(nibName: nil, bundle: nil)
        self.userName = user.login
        self.configuration = configuration
        self.modalPresentationStyle = .overFullScreen
        self.modalTransitionStyle = .crossDissolve
        self.modalPresentationCapturesStatusBarAppearance = true
    }
    
    override func loadView() {
        self.addUserDetailsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTransitions()
        self.presenter = self.resolver.resolve(outputs: self)
        self.router = self.resolver.resolve()
        self.presenter.loadUserDetails(userName: self.userName)
    }
    
    private func addUserDetailsView() {
        let detailsView = UserDetailsView()
        detailsView.delegate = self
        self.view = detailsView
    }
    
    private func configureUserDetailsView(with user: User) {
        self.container.configureView(with: user)
        self.container.userAvatarImageView.image = self.configuration.imageView?.image
    }
    
    private func setupTransitions() {
        guard let imageView = configuration?.imageView else { return }
        transitionHandler = ZoomTransitionHandler(fromImageView: imageView,
                                                  toImageView: self.container.userAvatarImageView)
        transitioningDelegate = transitionHandler
    }
    
    fileprivate func showLoadingView() {
        self.view.addSubview(self.loadingView)
        self.loadingView.startAnimating()
        self.loadingView.setConstraint(.centerX(in: self.view) + .centerY(in: self.view, offset: 100))
    }
    
    fileprivate func removeLoadingView() {
        self.loadingView.removeFromSuperview()
    }
    
    deinit {
        debugPrint("DE-INIT \(String(describing: type(of: self))) is calling to make sure all is good")
    }
}

extension UserDetailsViewController: UserDetailsViewDelegate {
    func openFollowersList(_ userDetailsView: UserDetailsView) {
        self.router.openFollowersList()
    }
    
    func openFollowingList(_ userDetailsView: UserDetailsView) {
        self.router.openFollowingList()
    }
    
    func openPublicRepoList(_ userDetailsView: UserDetailsView) {
        self.router.openPublicRepoList()
    }
    
    func openPublicGistList(_ userDetailsView: UserDetailsView) {
        self.router.openPublicGistList()
    }
    
    func closeView(_ userDetailsView: UserDetailsView) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension UserDetailsViewController: UserDetailsViewInputs {
    func onLoadingUserDetails() {
        self.showLoadingView()
    }
    
    func onErrorLoadingUserDetails() {
        self.removeLoadingView()
        super.showTryAgainErrorMessage()
    }
    
    func onSuccessLoadUserDetails(_ user: User) {
        self.removeLoadingView()
        self.configureUserDetailsView(with: user)
    }
}
