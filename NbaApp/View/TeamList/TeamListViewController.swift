//
//  ViewController.swift
//  NbaApp
//
//  Created by Canberk Bibican on 31.03.2022.
//

import UIKit
import Kingfisher

protocol TeamListViewControllerOutPut {
    func nbaListDataSuccess(data: NbaTeamListResponse)
    func nbaListDataError(error: Error)
}

class TeamListViewController: BaseViewController {

    lazy var teamListViewModel: ITeamListViewModel = TeamListViewModel()

    private let teamListTableView: TeamListTableView = TeamListTableView()
    @IBOutlet weak var tableView: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()
        teamListViewModel.setDelegate(output: self)
        initTableViewDelegate()
    }

    override func viewDidAppear(_ animated: Bool) {
        teamListViewModel.getNbaTeamList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    deinit {
        ImageCache.default.memoryStorage.removeAll()
    }

    private func initTableViewDelegate() {
        tableView.delegate = teamListTableView
        tableView.dataSource = teamListTableView
        teamListTableView.delegate = self
        TeamListTableViewCell.registerCellXib(with: tableView)
        tableView.separatorStyle = .none
    }
}

extension TeamListViewController: TeamListViewControllerOutPut {

    func nbaListDataSuccess(data: NbaTeamListResponse) {

        self.teamListTableView.update(newItemList: data.teamData ?? [])
        self.tableView.reloadData()

    }

    func nbaListDataError(error: Error) {
        if self.presentedViewController == nil {
            alertDialog(title: "Error", message: error.localizedDescription) {
                print("Tapped Ok")
            }
        }

    }

}

extension TeamListViewController: TeamListTableViewOutput {

    func onSelected(item: TeamData) {
        print(item)
    }
}
