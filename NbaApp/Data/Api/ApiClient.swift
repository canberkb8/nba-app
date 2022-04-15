//
//  ApiClient.swift
//  NbaApp
//
//  Created by Canberk Bibican on 31.03.2022.
//

import Foundation
import Alamofire

class ApiClient {
    
    static let utils = Utils()

    static func request<T: Decodable>(_ urlConvertible: URLRequestConvertible, completion: @escaping (Result<T, Error>) -> Void) {
        utils.activityIndicatorBegin()
        if Connectivity.isConnectedToInternet {
            AF.request(urlConvertible).responseDecodable { (response: AFDataResponse<T>) in
                switch response.result {
                case .success(let responseData):
                    completion(.success(responseData))
                case .failure(let error):
                    completion(.failure(error))
                }
                utils.activityIndicatorEnd()
            }
        } else {
            utils.activityIndicatorEnd()
            completion(.failure(CustomError.internetConnection))
        }
    }

    struct Connectivity {
        static let sharedInstance = NetworkReachabilityManager()!
        static var isConnectedToInternet: Bool {
            return self.sharedInstance.isReachable
        }
    }

}
