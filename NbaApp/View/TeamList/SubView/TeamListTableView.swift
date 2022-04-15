//
//  TableView.swift
//  NbaApp
//
//  Created by Canberk Bibican on 31.03.2022.
//

import UIKit

protocol TeamListTableViewProtocol {
    func update(newItemList: [TeamData])
}

protocol TeamListTableViewOutput: AnyObject {
    func onSelected(item: TeamData)
}

final class TeamListTableView: NSObject {

    private lazy var itemList: [TeamData] = []

    weak var delegate: TeamListTableViewOutput?

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itemList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: TeamListTableViewCell = tableView.dequeueReusableCell(withIdentifier: TeamListTableViewCell.storyboardID , for: indexPath)  as? TeamListTableViewCell else {
            return UITableViewCell()
        }
        cell.saveModel(model: itemList[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.onSelected(item: itemList[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}

extension TeamListTableView: UITableViewDelegate, UITableViewDataSource { }

extension TeamListTableView: TeamListTableViewProtocol {
    
    func update(newItemList: [TeamData]) {
        self.itemList = newItemList
    }
}
