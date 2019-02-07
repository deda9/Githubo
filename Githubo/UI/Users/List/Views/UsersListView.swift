import UIKit.UIView

protocol UsersListViewDelegate: AnyObject {
    func loadMoreUsers(_ view: UsersListView)
    func openUserDetailsView(_ cell: UserTableViewCell, user: User)
}

class UsersListView: UIView {
    var tableView: UITableView = {
        return Init(UITableView()) {
            $0.showsVerticalScrollIndicator = false
            $0.keyboardDismissMode = .onDrag
        }
    }()
    
    weak var delegate: UsersListViewDelegate?
    private let tableViewDataSource = GenericDataSource<User, UserTableViewCell>()
    
    convenience init() {
        self.init(frame: .zero)
        setupUI()
    }
    
    func scrollTableViewToTop() {
        self.tableView.scrollsToTop()
    }
    
    func setUsers(_ users: [User]) {
        self.tableViewDataSource.setItems(users, in: self.tableView)
    }
    
    func addUsers(_ users: [User]) {
        self.tableViewDataSource.addItems(users, in: self.tableView)
    }
    
    private func setupUI() {
        self.addSubviews()
        self.setupTableViewDelegates()
    }
    
    private func addSubviews() {
        self.addSubview(tableView)
        self.tableView.setConstraint(.matchParent(self))
    }
    
    private func setupTableViewDelegates() {
        self.tableViewDataSource.onConfigureCell = { cell, model, index in
            cell.configureCell(with: model)
        }
        self.tableViewDataSource.onDidSelectCell = { cell, model, index in
            if let delegate = self.delegate {
                weakify(self, delegate.openUserDetailsView(cell, user: model))()
            }
        }
        self.tableViewDataSource.loadMoreOffset = {
            return 10
        }
        self.tableViewDataSource.loadMoreHandler = {
            if let delegate = self.delegate {
                weakify(self, delegate.loadMoreUsers(self))()
            }
        }
        self.tableView.estimatedRowHeight = 100
        self.tableView.register(cell: UserTableViewCell.self)
        self.tableView.registerDelegate(with: tableViewDataSource)
    }
}
