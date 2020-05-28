//
//  HomeDataSourceController.swift
//  Cuiter
//
//  Created by Chris Stev on 26/05/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import Foundation
import LBTAComponents


class HomeDataSourceControlller: DatasourceController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        setupNavigationBarItem()
        
        let homeDataSource = HomeDataSource()
        self.datasource = homeDataSource
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // make cell dynamic size
        if let user = datasource?.item(indexPath) as? User {
            //user.bioText
            
            //get estimation based on bio text
            let approximateWidthBioTextView = view.frame.width - 12 - 50 - 12
            let size = CGSize(width: approximateWidthBioTextView, height: 1000)
            let attribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]
            
            let estimatedFrame = NSString(string: user.bioText).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attribute, context: nil)
            
            return CGSize(width: view.frame.width, height: estimatedFrame.height + 66)
        }
        
        return CGSize(width: view.frame.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 64)
    }
}
