//
//  LibraryTableViewController.swift
//  AurumFaciem
//
//  Created by Nathalia Melare on 03/09/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//

import UIKit

class LibraryTableViewController: UITableViewController {

    var categoria: CDCategory
    var CDAccess: DAOCoordinator
    var aulas: [CDVideo]

    init(nibName nibNameOrNil: String?,
         bundle nibBundleOrNil: Bundle?,
         categoryName: String,
         CDAccess: DAOCoordinator) {
        guard let category = CDAccess.categoryDAO.fetchByName(categoryName) else {
            fatalError("Biblioteca falhou em iniciar")
        }
        self.categoria = category
        self.CDAccess = CDAccess
        guard let aulas1 = category.videos?.array as? [CDVideo] else {
            fatalError("Biblioteca falhou em iniciar")
        }
        self.aulas = aulas1
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = categoria.name
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = AppColor.purple
        navigationController?.navigationBar.barTintColor = AppColor.purple
        tableView.register(UINib(nibName: "InformationTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "Information")
    }

    override func viewWillAppear(_ animated: Bool) {
        if navigationController?.navigationBar.isHidden ?? false {
            navigationController?.navigationBar.isHidden = false
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aulas.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Information",
                                                    for: indexPath) as? InformationTableViewCell {
            cell.titleLesson?.text = aulas[indexPath.row].word
            cell.playImage?.image = UIImage(named: "Player")
        return cell
    }
        return UITableViewCell()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let library = LibraryInfoViewController(nibName: nil,
                                                bundle: nil,
                                                category: categoria,
                                                CDAccess: CDAccess)
        library.index = indexPath.row
        present(library, animated: true, completion: nil)
    }
}
