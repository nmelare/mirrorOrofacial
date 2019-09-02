//
//  BibliotecaTableViewDataSource.swift
//  AurumFaciem
//
//  Created by Rafael Galdino on 31/08/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//

import Foundation
import UIKit

class TableViewDataSourceObj: NSObject, UITableViewDataSource {

    private var items: [String]
    private var cellIdentifier: String

    init(cellIdentifier: String, items: [String]) {
        self.items = items
        self.cellIdentifier = cellIdentifier
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                 for: indexPath)
        switch cell {
        case let bibliotecaCell as BibliotecaTableViewCell:
            bibliotecaCell.textLabel?.text = item
        default:
            cell.isHidden = true
        }
        return cell
    }
}
