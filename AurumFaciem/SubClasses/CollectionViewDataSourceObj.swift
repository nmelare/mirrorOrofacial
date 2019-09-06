//
//  CollectionViewDataSourceObj.swift
//  AurumFaciem
//
//  Created by Rafael Galdino on 01/09/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//

import UIKit

class CollectionViewDataSourceObj: NSObject, UICollectionViewDataSource {

    public var titles: [String]
    public var details: [String]
    private var cellIdentifier: String

    init(cellIdentifier: String, items: [String], details: [String]) {
        self.titles = items
        self.details = details
        self.cellIdentifier = cellIdentifier
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let title = titles[indexPath.row]
        let detail = details[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier,
                                                      for: indexPath)
        switch cell {
        case let treinoCell as TreinoCollectionViewCell:
            treinoCell.titleLabel.text = title
            treinoCell.detailLabel.text = detail
        default:
            cell.isHidden = true
        }
        return cell
    }
}
