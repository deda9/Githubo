import RxSwift
import Alamofire
import Moya

let repositoriesProvider =
    MoyaProvider<RepositoriesAPIs>(plugins: AppEnvironement.showLog ? [NetworkLoggerPlugin(verbose: true)] : [])

enum RepositoriesAPIs {
    case search((text: String, page: Int, sort: RepositorySort, order: RepositoryOrder))
}

extension RepositoriesAPIs: TargetType {
    var baseURL: URL {
        return AppEnvironement.baseURL
    }
    
    var path: String {
        switch self {
        case .search:
            return Constants.Pathes.Repositories.search
        }
    }
}

extension RepositoriesAPIs {
    var method: Moya.Method {
        switch self {
        case .search:
            return Moya.Method.get
        }
    }
}

extension RepositoriesAPIs {
    var task: Task {
        switch self {
        case .search(let config):
            let apiParamters = ["q": config.text, "page": config.page, "sort": config.sort.rawValue, "order": config.order.rawValue] as [String: Any]
            return .requestParameters(parameters: apiParamters, encoding: URLEncoding.default)
        }
    }
}

extension RepositoriesAPIs {
    var sampleData: Data {
        switch self {
        case .search:
            return Data()
        }
    }
}

extension RepositoriesAPIs {
    var headers: [String: String]? {
        return nil
    }
}
