import RxSwift
import Alamofire
import Moya

enum UsersAPIs {
    case usersList(Int, Int)
    case userDetails(String)
}

extension UsersAPIs: TargetType {
    var baseURL: URL {
        return AppEnvironement.baseURL
    }
    
    var path: String {
        switch self {
        case .usersList:
            return Constants.Pathes.Users.list
        case .userDetails(let userName):
            return Constants.Pathes.Users.list + "/\(userName)"
        }
    }
}

extension UsersAPIs {
    var method: Moya.Method {
        switch self {
        case .usersList,
             .userDetails:
            return Moya.Method.get
        }
    }
}

extension UsersAPIs {
    var task: Task {
        switch self {
        case .usersList(let perPage, let lastUserID):
            let apiParamters = ["per_page": perPage, "since": lastUserID]
            return .requestParameters(parameters: apiParamters, encoding: URLEncoding.default)
        case .userDetails:
            return .requestPlain
        }
    }
}

extension UsersAPIs {
    var sampleData: Data {
        switch self {
        case .usersList:
            return JSONMock.users.data
        case .userDetails:
            return Data()
        }
    }
}

extension UsersAPIs {
    var headers: [String: String]? {
        return nil
    }
}
