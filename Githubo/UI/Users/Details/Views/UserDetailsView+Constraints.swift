import UIKit

extension UserDetailsView {
    
    func setCloseButtonConstraints() {
        self.closeButton.setConstraint(
            .top(of: self, offset: Sizes.CloseButton.Margins.top) +
                .right(of: self, offset: -Sizes.CloseButton.Margins.right) +
                .width(Sizes.CloseButton.width) +
                .height(Sizes.CloseButton.height))
    }
        
    func setScrollViewConstrains() {
        self.scrollView.setConstraint(
            .left(of: self) +
                .width(UIScreen.width) +
                .top(of: self, applySafeArea: false) +
                .bottom(of: self))
    }
    
    func setPosterImageViewConstraints() {
        self.userAvatarImageView.setConstraint(
            .top(of: self.contentView, applySafeArea: false) +
                .left(of: self.contentView) +
                .right(of: self) +
                .height(Sizes.PosterImageView.height))
    }
    
    func setUserNameConstraints() {
        self.userNameLabel.setConstraint(
            .top(bottomOf: self.userAvatarImageView, offset: Sizes.UserName.Margins.top) +
                .left(of: self.contentView, offset: Sizes.UserName.Margins.left) +
                .right(of: self, offset: -Sizes.UserName.Margins.right))
    }
    
    func setUserTypeConstraints() {
        self.userTypeLabel.setConstraint(
            .top(bottomOf: self.userNameLabel, offset: Sizes.UserType.Margins.top) +
                .left(of: self.contentView, offset: Sizes.UserType.Margins.left) +
                .right(of: self, offset: -Sizes.UserType.Margins.right))
    }
    
    func setFollowersConstraints() {
        self.followersLabel.setConstraint(
            .top(bottomOf: self.userTypeLabel, offset: Sizes.Followers.Margins.top) +
                .left(of: self.contentView, offset: Sizes.Followers.Margins.left) +
                .right(of: self, offset: -Sizes.Followers.Margins.right))
        
    }
    
     func setFollowingConstraints() {
        self.followingLabel.setConstraint(
            .top(bottomOf: self.followersLabel, offset: Sizes.Following.Margins.top) +
                .left(of: self.contentView, offset: Sizes.Following.Margins.left) +
                .right(of: self, offset: -Sizes.Following.Margins.right))
    }
    
    func setPublicRepoConstraints() {
        self.publicRepoLabel.setConstraint(
            .top(bottomOf: self.followingLabel, offset: Sizes.PublicRepo.Margins.top) +
                .left(of: self.contentView, offset: Sizes.PublicRepo.Margins.left) +
                .right(of: self, offset: -Sizes.PublicRepo.Margins.right))
    }
    
    func setPublicGistConstraints() {
        self.publicGistLabel.setConstraint(
            .top(bottomOf: self.publicRepoLabel, offset: Sizes.PublicGist.Margins.top) +
                .left(of: self.contentView, offset: Sizes.PublicGist.Margins.left) +
                .right(of: self, offset: -Sizes.PublicGist.Margins.right))
    }
}
