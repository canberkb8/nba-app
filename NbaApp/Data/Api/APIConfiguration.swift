//
//  APIConfiguration.swift
//  NbaApp
//
//  Created by Canberk Bibican on 31.03.2022.
//

import Foundation
import Alamofire

protocol APIConfiguration: URLRequestConvertible {
    var method: HTTPMethod { get }
    var path: String { get }
    var parameters: Parameters? { get }
}
