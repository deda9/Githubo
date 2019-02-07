import UIKit.UIViewController

class SearchRepositoriesViewRouter {
    func openRepositoryDetailsView(_ repository: Repository) {
        //TODO: open view
    }
    
    func dismissSearchUserView(from parent: UIViewController) {
        parent.navigationController?.dismiss(animated: true, completion: nil)
    }
}
