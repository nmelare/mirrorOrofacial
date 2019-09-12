//
//  TreinoCollectionView.swift
//  AurumFaciem
//
//  Created by Rafael Galdino on 01/09/19.
//  Copyright © 2019 Rafael Galdino. All rights reserved.
//

import Foundation
import UIKit

class TreinoCollectionViewDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    weak var viewController: HomeScreenViewController?

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let viewFrame = collectionView.frame
        let width = viewFrame.width
        let height = viewFrame.height

        return CGSize(width: width/2 - width/40,
                      height: height/2 - height/25)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return collectionView.frame.width/80
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset = collectionView.frame.width/80
        return UIEdgeInsets(top: inset,
                            left: inset,
                            bottom: inset,
                            right: inset)
    }

    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        guard let cell = (collectionView.cellForItem(at: indexPath)) else { return }
        cell.backgroundColor = .blue
        if cell.isSelected == true {
            collectionView.deselectItem(at: indexPath,
                                        animated: true)
        }
        let trialViewController = TrialViewController(nibName: nil, bundle: nil)
        viewController?.changeView(controller: trialViewController)
    }
    func collectionView(_ collectionView: UICollectionView,
                        didDeselectItemAt indexPath: IndexPath) {
        guard let cell = (collectionView.cellForItem(at: indexPath)) else { return }
        cell.backgroundColor = .yellow
    }
}
