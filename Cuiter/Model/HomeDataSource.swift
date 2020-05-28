//
//  HomeDataSource.swift
//  Cuiter
//
//  Created by Chris Stev on 26/05/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import LBTAComponents

class HomeDataSource: Datasource {
    //let words = ["user1", "user2", "user3"]
    
    let user: [User] = {
       let firstUser = User(name: "TEST", username: "@testtest" , bioText: "Lorem ipsum dolor sit amet, ")
        let secUser = User(name: "Chris Stev", username: "@christev", bioText: "consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
        
        return [firstUser, secUser]
    }()
    
    let tweet: [Tweet] = {
        let firstUser = User(name: "Testing Name", username: "@testtest" , bioText: "Lorem ipsum dolor sit amet, ")
        let tweet = Tweet(user: firstUser, message: "Welcome to my world, really hope you guys enjoy")
        let tweet2 = Tweet(user: firstUser, message: "This is second tweet, from my exercise to help me more understand about what happend in ios dev and code.")
        return[tweet, tweet2]
    }()
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [HeaderCell.self]
    }
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [FooterCell.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 1 {
            return tweet[indexPath.item]
        }
        return user[indexPath.item]
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1 {
            return tweet.count
        }
        
        return user.count
    }
}
