struct RepositoryResponse: Codable {
    let totalCount: Int
    let incompleteResults: Bool
    let repositoriesList: [Repository]
}

extension RepositoryResponse {
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case repositoriesList = "items"
    }
}
