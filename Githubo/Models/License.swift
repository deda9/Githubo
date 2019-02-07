struct License: Codable {
    let key, name, spdxID: String
    let url: String?
    let nodeID: String?
}

extension License {
    enum CodingKeys: String, CodingKey {
        case key, name
        case spdxID = "spdx_id"
        case url
        case nodeID = "node_id"
    }
}
