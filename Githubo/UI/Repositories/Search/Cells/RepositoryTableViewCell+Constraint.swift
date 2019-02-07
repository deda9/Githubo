extension RepositoryTableViewCell {
    func setReposityNameConstraints() {
        self.repositoryNameLabel.setConstraint(.top(of: self, offset: Size.RepositoyName.Margins.top) +
            .left(of: self, offset: Size.RepositoyName.Margins.left) +
            .right(of: self, offset: Size.RepositoyName.Margins.right))
    }
    
    func setReposityDescConstraints() {
        self.descriptionLabel.setConstraint(.left(of: self.repositoryNameLabel) +
            .top(bottomOf: self.repositoryNameLabel, offset: Size.RepositoyDescription.Margins.top)
            + .bottom(of: self, offset: Size.RepositoyDescription.Margins.bottom))
    }
}
