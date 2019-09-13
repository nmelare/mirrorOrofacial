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
    var CDAccess: DAOCoordinator

    init(nibName: String?,
         bundle: Bundle?,
         CDAccess: DAOCoordinator) {
        self.CDAccess = CDAccess
        self.videos = CDAccess.videoDAO.getAllVideos()
        self.lessons = CDAccess.lessonDAO.getAllLessons().sorted(
            by: { ($0.name ?? "").lowercased() < ($1.name ?? "").lowercased() }
        )
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
        treinoDataSource.titles = getLessonsNames()
        treinoDataSource.details = getLessonsCategories().map({ (detail) -> String in
            var formated = detail
            if formated.count > 25 {
                formated = formated.prefix(25) + "..."
            }
            return formated
        }).sorted()
        bibliotecaDataSource.items = getCategories().sorted()
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

    func getLessonsNames() -> [String] {
        return lessons.map { (lesson) -> String in
            return lesson.name ?? ""
        }
    }

    func getLessonsCategories() -> [String] {
        return lessons.map({ (lesson) -> String in
            guard let allCategories = lesson.categories else { return "" }
            return allCategories.map({ (category) -> String in
                guard let lessonCategory = category as? CDCategory else { return "" }
                return lessonCategory.name ?? ""
            }).joined(separator: ", ")
            }
        )
    }

    func getCategories() -> [String] {
        let categories = CDAccess.categoryDAO.getAllCategories()
        return categories.map { (category) -> String in
            return category.name ?? ""
        }
    }
}
