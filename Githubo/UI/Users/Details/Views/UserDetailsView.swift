import UIKit.UIView

protocol UserDetailsViewDelegate: AnyObject {
    func closeView(_ userDetailsView: UserDetailsView)
    func openFollowersList(_ userDetailsView: UserDetailsView)
    func openFollowingList(_ userDetailsView: UserDetailsView)
    func openPublicRepoList(_ userDetailsView: UserDetailsView)
    func openPublicGistList(_ userDetailsView: UserDetailsView)
}

class UserDetailsView: UIView, UIGestureRecognizerDelegate {
    
    weak var delegate: UserDetailsViewDelegate?
    var closeButton: IncreaseHitAreaButton = UIButton.close
    var userAvatarImageView: UIImageView = UIImageView.posterImageView
    var userNameLabel: UILabel = UILabel.titleLabel
    var followersLabel: UILabel = UILabel.fullDescriptionLabel
    var followingLabel: UILabel = UILabel.fullDescriptionLabel
    var publicRepoLabel: UILabel = UILabel.fullDescriptionLabel
    var publicGistLabel: UILabel = UILabel.fullDescriptionLabel
    var userTypeLabel: UILabel = UILabel.subTitleLabel
    
    lazy var scrollView: UIScrollView = {
        let tap = UITapGestureRecognizer()
        tap.cancelsTouchesInView = false
        let scrollView = UIScrollView(frame: self.frame)
        scrollView.isScrollEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.canCancelContentTouches = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.addGestureRecognizer(tap)
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    convenience init() {
        self.init(frame: .zero)
        setupUI()
    }

    func configureView(with user: User) {
        self.userNameLabel.text = user.name ?? user.login
        self.userTypeLabel.text = "★ " + user.type
        self.followersLabel.text = "UserDetailsView.Follower.Label".localize() + "(\(user.followers ?? 0))"
        self.followingLabel.text = "UserDetailsView.Following.Label".localize() + "(\(user.following ?? 0))"
        self.publicRepoLabel.text = "UserDetailsView.PublicRepo.Label".localize() + "(\(user.publicRepos ?? 0))"
        self.publicGistLabel.text = "UserDetailsView.PublicGist.Label".localize() + "(\(user.publicGists ?? 0))"
        self.scrollView.updateContentViewSize()
    }
    
    private func setupUI() {
        self.backgroundColor = UIColor.white
        self.addSubviews()
    }
    
    private func addSubviews() {
        self.addScrollView()
        self.addCloseButton()
        self.addPosterImageView()
        self.addUserName()
        self.addUserType()
        self.addFollowers()
        self.addFollowing()
        self.addPublicRepo()
        self.addPublicGist()
    }
    
    private func addCloseButton() {
        self.addSubview(self.closeButton)
        self.setCloseButtonConstraints()
        self.closeButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeView)))
    }
    
    @objc private func closeView() {
        self.delegate?.closeView(self)
    }
    
    private func addScrollView() {
        self.scrollView.addSubview(self.contentView)
        self.addSubview(self.scrollView)
        self.setScrollViewConstrains()
    }
    
    private func addPosterImageView() {
        self.contentView.addSubview(self.userAvatarImageView)
        self.setPosterImageViewConstraints()
    }
    
    private func addUserName() {
        self.contentView.addSubview(self.userNameLabel)
        self.setUserNameConstraints()
    }
    
    private func addUserType() {
        self.contentView.addSubview(self.userTypeLabel)
        self.setUserTypeConstraints()
    }
    
    private func addFollowers() {
        self.contentView.addSubview(self.followersLabel)
        self.setFollowersConstraints()
        self.followersLabel.isUserInteractionEnabled = true
        self.followersLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openFollowersView)))
    }
    
    @objc private func openFollowersView() {
        self.delegate?.openFollowersList(self)
    }
    
    private func addFollowing() {
        self.contentView.addSubview(self.followingLabel)
        self.setFollowingConstraints()
        self.followingLabel.isUserInteractionEnabled = true
        self.followingLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openFollowingView)))
    }
    
    @objc private func openFollowingView() {
        self.delegate?.openFollowersList(self)
    }
    
    private func addPublicRepo() {
        self.contentView.addSubview(self.publicRepoLabel)
        self.setPublicRepoConstraints()
        self.publicRepoLabel.isUserInteractionEnabled = true
        self.publicRepoLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openPublicRepoView)))
    }
    
    @objc private func openPublicRepoView() {
        self.delegate?.openPublicRepoList(self)
    }
    
    private func addPublicGist() {
        self.contentView.addSubview(self.publicGistLabel)
        self.setPublicGistConstraints()
        self.publicGistLabel.isUserInteractionEnabled = true
        self.publicGistLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(openPublicGistView)))
    }
    
    @objc private func openPublicGistView() {
        self.delegate?.openPublicGistList(self)
    }
}
