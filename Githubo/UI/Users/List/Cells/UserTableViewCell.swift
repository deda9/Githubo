import UIKit

class UserTableViewCell: BaseUITableViewCell {
    
    var userAvatarImageView: UIImageView = UIImageView.avatarImageView
    var userNameLabel: UILabel = UILabel.titleLabel
    var userTypeLabel: UILabel = UILabel.subTitleLabel
    
    override func addSubViews() {
        [self.userAvatarImageView,
         self.userNameLabel,
         self.userTypeLabel].forEach {
            self.addSubview($0)
        }
    }
    
    override func setLayoutConstraints() {
        self.setPosterImageViewConstraints()
        self.setUserNameLabelConstraints()
        self.setUserTypeLabelConstraints()
    }
    
    func configureCell(with user: User) {
        self.userNameLabel.text = user.login.capitalizeFirstLetter()
        self.userTypeLabel.text = user.type
        self.userAvatarImageView.download(url: user.avatarURL, placeholder: ImageResource.logo.image)
        self.userAvatarImageView.round(by: Sizes.UserAvatarImageView.width / 2)
    }
}
