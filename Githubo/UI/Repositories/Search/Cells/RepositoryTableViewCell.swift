import UIKit

class RepositoryTableViewCell: BaseUITableViewCell {
    
    var repositoryNameLabel: UILabel = UILabel.titleLabel
    var descriptionLabel: UILabel = UILabel.subTitleLabel
    
    override func addSubViews() {
        [self.repositoryNameLabel,
         self.descriptionLabel].forEach {
            self.addSubview($0)
        }
    }
    
    override func setLayoutConstraints() {
        self.setReposityDescConstraints()
        self.setReposityNameConstraints()
    }
    
    func configureCell(with repo: Repository) {
        self.repositoryNameLabel.text = repo.fullName ?? ""
        let stars = "★ " + "(\(repo.stargazersCount))"
        let forks = "RepositoryTableViewCell.ForksLabel".localize() + "(\(repo.forks))"
        self.descriptionLabel.text = stars + " " + forks
    }
}
