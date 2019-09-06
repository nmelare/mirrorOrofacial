//
//  HomeScreenViewController.swift
//  AurumFaciem
//
//  Created by Rafael Galdino on 31/08/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController {
    let videos: [CDVideo]
    let lessons: [CDLesson]
    var lessonsDAO: CDLessonDAO

    init(nibName: String?,
         bundle: Bundle?,
         videoDAO: CDVideoDAO,
         lessonDAO: CDLessonDAO) {
        self.videos = videoDAO.fetchAllVideos()
        self.lessons = lessonDAO.fetchAllLessons()
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
        treinoDataSource.titles = getLessonsNames()
        treinoDataSource.details = getVideosCategories()
        bibliotecaDataSource.items = getVideosNames()
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
        var names: [String] = []
        names = lessons.map({ (lesson) -> String in
            return lesson.name ?? ""
        })
        if names.isEmpty {
            names = ["Vogais", "Consoantes I", "Consoantes II", "Dia a Dia"]
        }
        return names
    }

    func getVideosCategories() -> [String] {
        var names: [String] = []
        names = videos.map({ (video) -> String in
            return video.category ?? ""
        })
        if names.isEmpty {
            names = ["p", "b", "m", "n"]
        }
        return names
    }

    func getVideosNames() -> [String] {
        var names: [String] = []
        names = videos.map({ (video) -> String in
            return video.word ?? ""
        })
        if names.isEmpty {
            names = ["Amor", "Amarra", "Bíblia", "Bilhar"]
        }
        return names
    }

}
