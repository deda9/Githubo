import UIKit.UISearchBar
import RxSwift

class SearchRepositoriesBarView: UISearchBar {
    
    private var searchBarShouldBeginEditing: Bool = true
    private var disposeBag = DisposeBag()
    
    var searchDebounceTime: Double = 0.5
    var didClickSearchButtonHandler: ((Bool) -> Void)?
    var didSearchHandler: ((String) -> Void)?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        let frame = CGRect(x: 0, y: 0, width: UIScreen.width, height: 20)
        super.init(frame: frame)
        setup()
    }
    
    private func setup() {
        self.placeholder = "RepositoriesListView.SearchBarView.Placeholder".localize()
        self.delegate = self
        rx.text.orEmpty
            .debounce(searchDebounceTime, scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .filter { !$0.isEmpty }
            .subscribe(onNext: { [weak self] text in
                guard let strongSelf = self else {
                    return
                }
                strongSelf.didSearchHandler?(text)
            }).disposed(by: disposeBag)
    }
    
    func enableCancelButton() {
        self.showsCancelButton = true
    }
    
    func enableFirstResponder() {
        self.becomeFirstResponder()
    }
    
    func setupOnClickListener() {
        self.searchBarShouldBeginEditing = false
        self.subviews.forEach {
            $0.subviews.forEach {
                $0.isUserInteractionEnabled = true
                $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didClickSearchBar)))
            }
        }
        self.isUserInteractionEnabled = true
    }
    
    @objc private func didClickSearchBar() {
        self.delegate?.searchBarSearchButtonClicked?(self)
    }
}

extension SearchRepositoriesBarView: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.didClickSearchButtonHandler?(true)
    }
}
