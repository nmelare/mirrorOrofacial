//
//  HomeScreenViewController.swift
//  AurumFaciem
//
//  Created by Rafael Galdino on 31/08/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
// swiftlint:disable weak_delegate
// disabled due to forced exception with no clear resolution in lines 37 and 41

import UIKit

class HomeScreenViewController: UIViewController {
    let videos: [CDVideo]
    let lessons: [CDLesson]
    var lessonsDAO: CDLessonDAO

    init(nibName: String?,
         bundle: Bundle?,
         videoDAO: CDVideoDAO,
         lessonDAO: CDLessonDAO) {
        self.videos = videoDAO.getAllVideos()
        self.lessons = lessonDAO.getAllLessons()
        self.lessonsDAO = lessonDAO
        super.init(nibName: "HomeScreenViewController",
                   bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @IBOutlet weak var treinoCollectionView: UICollectionView!
    @IBOutlet weak var bibliotecaTableView: UITableView!

    let bibliotecaDataSource = TableViewDataSourceObj(cellIdentifier: "bibliotecaIdentifier",
                                                      items: [])
    let bibliotecaDelegate = BibliotecaTableViewDelegate()
    let treinoDataSource = CollectionViewDataSourceObj(cellIdentifier: "treinoIdentifier",
                                                       items: [],
                                                       details: [])
    let treinoDelegate = TreinoCollectionViewDelegate()

    override func viewDidLoad() {
        super.viewDidLoad()

        treinoDelegate.viewController = self
        bibliotecaDelegate.viewController = self
        navigationController?.navigationBar.isTranslucent = false
//        treinoDataSource.titles = getLessonsNames()
//        treinoDataSource.details = getVideosCategories()
//        bibliotecaDataSource.items = getVideosNames()
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

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }

    func changeView(controller: TrialViewController) {
        present(controller, animated: true, completion: nil)
    }

    func changeView(controller: LibraryTableViewController) {
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
