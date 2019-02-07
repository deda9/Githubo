import UIKit.UIView

protocol RepositoryListViewDelegate: AnyObject {
    func loadMoreRepository(_ view: RepositoryListView)
    func openRepositoryDetailsView(_ cell: RepositoryTableViewCell, repository: Repository)
}

class RepositoryListView: UIView {
    var tableView: UITableView = {
        return Init(UITableView()) {
            $0.showsVerticalScrollIndicator = false
            $0.keyboardDismissMode = .onDrag
        }
    }()
    
    weak var delegate: RepositoryListViewDelegate?
    
    private let tableViewDataSource = GenericDataSource<Repository, RepositoryTableViewCell>()
    
    convenience init() {
        self.init(frame: .zero)
        setupUI()
    }
    
    func scrollTableViewToTop() {
        self.tableView.scrollsToTop()
    }
    
    func setRepository(_ repositories: [Repository]) {
        self.tableViewDataSource.setItems(repositories, in: self.tableView)
    }
    
    func addRepository(_ repositories: [Repository]) {
        self.tableViewDataSource.addItems(repositories, in: self.tableView)
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
                weakify(self, delegate.openRepositoryDetailsView(cell, repository: model))()
            }
        }
        self.tableViewDataSource.loadMoreOffset = {
            return 10
        }
        self.tableViewDataSource.loadMoreHandler = {
            if let delegate = self.delegate {
                weakify(self, delegate.loadMoreRepository(self))()
            }
        }
        self.tableView.estimatedRowHeight = 100
        self.tableView.register(cell: RepositoryTableViewCell.self)
        self.tableView.registerDelegate(with: tableViewDataSource)
    }
}
