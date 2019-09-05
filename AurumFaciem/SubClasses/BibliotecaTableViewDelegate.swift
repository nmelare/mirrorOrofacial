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
        print("selected")
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.isSelected == true {
                tableView.deselectRow(at: indexPath,
                                      animated: true)
            }
        }
        let libraryTableViewController = LibraryTableViewController(nibName: nil, bundle: nil)
        viewController?.changeView(controller: libraryTableViewController)
    }

    func tableView(_ tableView: UITableView,
                   didDeselectRowAt indexPath: IndexPath) {
        print("desselected")
    }
}
