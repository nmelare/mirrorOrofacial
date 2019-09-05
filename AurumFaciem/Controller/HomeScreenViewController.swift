//
//  HomeScreenViewController.swift
//  AurumFaciem
//
//  Created by Rafael Galdino on 31/08/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {

    @IBOutlet weak var treinoCollectionView: UICollectionView!
    @IBOutlet weak var bibliotecaTableView: UITableView!

    let bibliotecaDataSource = TableViewDataSourceObj(cellIdentifier: "bibliotecaIdentifier",
                                                      items: ["a", "b"])
    let bibliotecaDelegate = BibliotecaTableViewDelegate()
    let treinoDataSource = CollectionViewDataSourceObj(cellIdentifier: "treinoIdentifier",
                                                       items: ["a", "b", "d"], details: ["c", "d", "d"])
    let treinoDelegate = TreinoCollectionViewDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()
        treinoDelegate.viewController = self
        bibliotecaDelegate.viewController = self
        navigationController?.navigationBar.isTranslucent = true
        bibliotecaTableView.register(UINib(nibName: "BibliotecaTableViewCell",
                                           bundle: nil),
                                     forCellReuseIdentifier: "bibliotecaIdentifier")
        bibliotecaTableView.rowHeight = UITableView.automaticDimension
        bibliotecaTableView.estimatedRowHeight = 44
        bibliotecaTableView.dataSource = bibliotecaDataSource
        bibliotecaTableView.delegate = bibliotecaDelegate
        treinoCollectionView.register(UINib(nibName: "TreinoCollectionViewCell", bundle: nil),
                                      forCellWithReuseIdentifier: "treinoIdentifier")
        treinoCollectionView.dataSource = treinoDataSource
        treinoCollectionView.delegate = treinoDelegate
    }
    
    func changeView(controller: TrialViewController) {
        present(controller, animated: true, completion: nil)
    }
    
    func changeView(controller: LibraryTableViewController) {
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
