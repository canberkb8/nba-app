//
//  TeamListViewModel.swift
//  NbaApp
//
//  Created by Canberk Bibican on 31.03.2022.
//

import Foundation

protocol ITeamListViewModel {
    func setDelegate(output: TeamListViewControllerOutPut)
    func getNbaTeamList()
}

final class TeamListViewModel: ITeamListViewModel {

    var viewControllerOutput: TeamListViewControllerOutPut?

    func setDelegate(output: TeamListViewControllerOutPut) {
        viewControllerOutput = output
    }

    func getNbaTeamList() {
        ApiClient.request(ApiEndPoint.nbaTeamList) { [weak self] (_ result: Result<NbaTeamListResponse, Error>) in
            switch result {
            case .success(let response):
                self?.viewControllerOutput?.nbaListDataSuccess(data: response)
            case .failure(let error):
                self?.viewControllerOutput?.nbaListDataError(error: error)
            }
        }
    }
}
