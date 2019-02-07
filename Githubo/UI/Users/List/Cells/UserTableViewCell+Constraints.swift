import UIKit.UIView

extension UserTableViewCell {
    func setPosterImageViewConstraints() {
        self.userAvatarImageView.setConstraint(
            .top(of: self, offset: Sizes.UserAvatarImageView.Margins.top) +
                .bottom(of: self, offset: -Sizes.UserAvatarImageView.Margins.bottom) +
                .left(of: self, offset: Sizes.UserAvatarImageView.Margins.left))
        
        self.userAvatarImageView.setConstraint(.width(Sizes.UserAvatarImageView.width))
        self.userAvatarImageView.setConstraint(.height(Sizes.UserAvatarImageView.height))
    }
    
    func setUserNameLabelConstraints() {
        self.userNameLabel.setConstraint(
            .left(rightOf: self.userAvatarImageView, offset: Sizes.UserName.Margins.left) +
                .top(of: self, offset: Sizes.UserName.Margins.top) +
                .right(of: self, offset: -Sizes.UserName.Margins.right))
    }
    
    func setUserTypeLabelConstraints() {
        self.userTypeLabel.setConstraint(
            .left(of: self.userNameLabel) +
                .top(bottomOf: self.userNameLabel, offset: Sizes.UserType.Margins.top) +
                .right(of: self.userNameLabel))
    }
}
