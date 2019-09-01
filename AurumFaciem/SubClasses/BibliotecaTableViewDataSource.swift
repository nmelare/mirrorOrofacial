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
    // We keep this public and mutable, to enable our data
    // source to be updated as new data comes in.
    public var categories: [String]

    init(categories: [String]) {
        self.categories = categories
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let category = categories[indexPath.row]
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "reuseIdentifier",
            for: indexPath
        )

        cell.textLabel?.text = category
        cell.detailTextLabel?.text = category
        return cell
    }
}
