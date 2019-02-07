import UIKit.UIView

extension UserTableViewCell {
    struct Sizes {
        struct UserAvatarImageView {
            static let width: CGFloat = 100
            static let height: CGFloat = 100
            
            struct Margins {
                static let top: CGFloat = 16
                static let left: CGFloat = 16
                static let bottom: CGFloat = 16
            }
        }
        
        struct UserName {
            struct Margins {
                static let top: CGFloat = 32
                static let left: CGFloat = 16
                static let right: CGFloat = 16
            }
        }
        
        struct UserType {
            struct Margins {
                static let top: CGFloat = 10
            }
        }
    }
}
