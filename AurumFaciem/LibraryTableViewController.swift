//
//  LibraryTableViewController.swift
//  AurumFaciem
//
//  Created by Nathalia Melare on 03/09/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//

import UIKit

class LibraryTableViewController: UITableViewController {

    var aulas: [String] = ["zero", "um","dois","tres","quatro","cinco","seis","sete","oito","nove","dez","onze"]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "InformationTableViewCell", bundle: nil), forCellReuseIdentifier: "Information")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return aulas.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Information", for: indexPath) as? InformationTableViewCell {
            cell.titleLesson?.text = aulas[indexPath.row]
            cell.playImage?.image = UIImage(named: "Player")
        return cell
    }
        return UITableViewCell()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let library = LibraryInfoViewController() as UIViewController
        navigationController?.pushViewController(library, animated: true)
    }
}
