//
//  ApiEndPoint.swift
//  NbaApp
//
//  Created by Canberk Bibican on 31.03.2022.
//

import Foundation
import Alamofire

enum ApiEndPoint: APIConfiguration {

    case nbaTeamList
    // query -> case nbaTeamList(id: String)
    // parameters -> case nbaTeamList(params: [String: Any])

    var method: HTTPMethod {
        switch self {
        case .nbaTeamList: return .get
        }
    }

    var path: String {
        switch self {
        case .nbaTeamList: return "canberkb8/nba-teams-icons/master/teamdata.json"
        //query -> case .nbaTeamList(let id): return "canberkb8/nba-teams-icons/master/teamdata.json"+id
        }
    }

    var parameters: Parameters? {
        switch self {
        case .nbaTeamList: return nil
        // parameters -> case .nbaTeamList(let params): return params
        }

    }

    func asURLRequest() throws -> URLRequest {
        // https://raw.githubusercontent.com/canberkb8/nba-teams-icons/master/teamdata.json
        let baseUrl = try "https://raw.githubusercontent.com/".asURL()
        var urlRequest = URLRequest(url: baseUrl.appendingPathComponent(path))
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        // HTTP Headers
        urlRequest.headers = headers
        // Parameters
        let encoding: ParameterEncoding = {
            switch method {
            case .post:
                return JSONEncoding.default
            default:
                return URLEncoding.default
            }
        }()

        return try encoding.encode(urlRequest, with: parameters)

    }

    var headers: HTTPHeaders {
        return ["Content-Type": "application/json",
            "Accept": "application/json"]
    }
}
