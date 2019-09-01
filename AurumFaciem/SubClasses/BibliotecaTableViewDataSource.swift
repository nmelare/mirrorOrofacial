//
//  BibliotecaTableViewDataSource.swift
//  AurumFaciem
//
//  Created by Rafael Galdino on 31/08/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//

import Foundation
import UIKit

class BibliotecaTableViewDataSource: NSObject, UITableViewDataSource {

    public var items: [String]

    init(categories: [String]) {
        self.items = categories
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "bibliotecaIdentifier",
                                                       for: indexPath) as? BibliotecaTableViewCell
            else {
                return UITableViewCell(style: .default, reuseIdentifier: nil)
        }

        cell.textLabel?.text = item
        return cell
    }
}
