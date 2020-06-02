//
//  HomeDataSource.swift
//  Cuiter
//
//  Created by Chris Stev on 26/05/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON


extension Collection where Iterator.Element == JSON {
    func decode<T: JSONDecodable>() throws -> [T] {
        return try map{ try T(json: $0) }
    }
}

class HomeDataSource: Datasource, JSONDecodable {
    
    let users: [User]
    let tweets: [Tweet]
    
    required init(json: JSON) throws {
        
        guard let array = json["users"].array, let tweetArray = json["tweets"].array else {
            throw NSError(domain: "com.letsbuildthatapp", code: 1, userInfo: [NSLocalizedDescriptionKey: "user not valid in JSON"])
        }
        
        //self.users = array.map{ return User(json: $0) }
        //self.tweets = tweetArray.map{ Tweet(json: $0) }
        
        self.users = try array.decode()
        self.tweets = try tweetArray.decode()
    }
    
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
            return tweets[indexPath.item]
        }
        return users[indexPath.item]
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1 {
            return tweets.count
        }
        
        return users.count
    }
}
