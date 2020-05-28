//
//  HomeDataSourceController+navbar.swift
//  Cuiter
//
//  Created by Chris Stev on 26/05/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import UIKit

extension HomeDataSourceControlller {
    fileprivate func setupNavRightItem() {
        let searchButton = UIButton(type: .system)
        searchButton.setImage(UIImage(named: "account-circle")!.withRenderingMode(.alwaysOriginal), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        let composeButton = UIButton(type: .system)
        composeButton.setImage(UIImage(named: "account-circle")!.withRenderingMode(.alwaysOriginal), for: .normal)
        composeButton.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: composeButton), UIBarButtonItem(customView: searchButton)]
    }
    
    fileprivate func setupNavLeftItem() {
        let navLeftView = UIButton(type: .system)
        navLeftView.setImage(UIImage(named: "account-circle")!.withRenderingMode(.alwaysOriginal), for: .normal)
        navLeftView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: navLeftView)
    }
    
    func setupNavigationBarItem() {
        let titleView = UIImageView(image: UIImage(named: "twitter")!)
        titleView.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        titleView.contentMode = .scaleAspectFit
        
        navigationItem.titleView = titleView
        
        setupNavLeftItem()
        
        setupNavRightItem()
        
        //set bck color
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.backgroundColor = .white
        
        //set thin nav bar separator
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        let navBarSeparatorView = UIView()
        navBarSeparatorView.backgroundColor = UIColor(r: 230, g: 230, b: 230)
        view.addSubview(navBarSeparatorView)
        navBarSeparatorView.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0.5)
    }
}
