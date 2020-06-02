//
//  HomeDataSourceController.swift
//  Cuiter
//
//  Created by Chris Stev on 26/05/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import Foundation
import LBTAComponents
import TRON
import SwiftyJSON

class HomeDataSourceControlller: DatasourceController {
    
    let errorMessageLabel: UILabel = {
        let label = UILabel()
        label.text = "Apologies something went wrong. Please try again later..."
        label.textAlignment = .center
        label.numberOfLines = 0
        label.isHidden = true
       return label
    }()
        
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(errorMessageLabel)
        errorMessageLabel.fillSuperview()
        
        collectionView.backgroundColor = UIColor(r: 232, g: 236, b: 241)
        setupNavigationBarItem()
        
//        let homeDataSource = HomeDataSource()
//        self.datasource = homeDataSource
        
        Service.instance.fetchHome { (homeData, error) in
            if let error = error {
                self.errorMessageLabel.isHidden = false
                
                if let apiError = error as? APIError<Service.JSONError> {
                    if apiError.response?.statusCode != 200 {
                        self.errorMessageLabel.text = "Status code was not 200"
                    }
                }
                
                print("error fetch data", error)
                return
            }
            self.errorMessageLabel.isHidden = true
            self.datasource = homeData
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 0 {
            // make cell dynamic size
            if let user = datasource?.item(indexPath) as? User {
                //user.bioText
                
                //get estimation based on bio text
                let estimatedHeight = estimatedHeightForText(user.bioText)
                
                return CGSize(width: view.frame.width, height: estimatedHeight + 66)
            }
        } else if indexPath.section == 1 {
            
            guard let tweet = datasource?.item(indexPath) as? Tweet else { return .zero }
            
            //get estimation based on bio text
           
            let estimatedHeight = estimatedHeightForText(tweet.message)
            
            return CGSize(width: view.frame.width, height: estimatedHeight + 74)
        }
        
        return CGSize(width: view.frame.width, height: 200)
    }
    
    private func estimatedHeightForText(_ text: String) -> CGFloat {
        
        let approximateWidthBioTextView = view.frame.width - 12 - 50 - 12
        let size = CGSize(width: approximateWidthBioTextView, height: 1000)
        let attribute = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]
        
        let estimatedFrame = NSString(string: text).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attribute, context: nil)
        
        return estimatedFrame.height
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
