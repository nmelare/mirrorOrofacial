//
//  LibraryTableViewController.swift
//  AurumFaciem
//
//  Created by Nathalia Melare on 03/09/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//

import UIKit

class LibraryTableViewController: UITableViewController {

    var aulas: [String] = ["zero", "um", "dois", "tres", "quatro", "cinco",
                           "seis", "sete", "oito", "nove", "dez"]

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = #colorLiteral(red: 0.2509803922, green: 0.2392156863, blue: 0.3450980392, alpha: 1)
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.2509803922, green: 0.2392156863, blue: 0.3450980392, alpha: 1)
        navigationItem.title = "Título Genérico"
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
            cell.titleLesson?.text = aulas[indexPath.row]
            cell.playImage?.image = UIImage(named: "Player")
        return cell
    }
        return UITableViewCell()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let library = LibraryInfoViewController()
        library.index = indexPath.row
        present(library, animated: true, completion: nil)
    }
}
