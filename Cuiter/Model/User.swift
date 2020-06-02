//
//  User.swift
//  Cuiter
//
//  Created by Chris Stev on 26/05/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import UIKit
import SwiftyJSON
import TRON

struct User: JSONDecodable {
    let name: String
    let username: String
    let bioText: String
    let profileImageUrl: String
    
    init(json: JSON) {
        name = json["name"].stringValue
        username = json["username"].stringValue
        bioText = json["bio"].stringValue
        profileImageUrl = json["profileImageUrl"].stringValue
    }
}
