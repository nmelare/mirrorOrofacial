//
//  BibliotecaTableView.swift
//  AurumFaciem
//
//  Created by Rafael Galdino on 02/09/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//

import Foundation
import UIKit

class BibliotecaTableViewDelegate: NSObject, UITableViewDelegate {

    public weak var viewController: HomeScreenViewController?

    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        guard let cell = (tableView.cellForRow(at: indexPath) as? BibliotecaTableViewCell) else { return }
        if cell.isSelected == true {
            tableView.deselectRow(at: indexPath,
                                  animated: true)
        }
        guard let homeVC = viewController else { return }
        let controller = LibraryTableViewController(nibName: "LibraryTableViewController",
                                                    bundle: nil,
                                                    categoryName: cell.textLabel?.text ?? "",
                                                    CDAccess: homeVC.CDAccess)
        homeVC.changeView(controller: controller)
    }

    func tableView(_ tableView: UITableView,
                   didDeselectRowAt indexPath: IndexPath) {
    }
}
