//
//  Tweet.swift
//  Cuiter
//
//  Created by Chris Stev on 27/05/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import Foundation
import SwiftyJSON
import TRON

struct Tweet: JSONDecodable {
    let user: User
    let message: String
    
    init(json: JSON) {
        let userJSON = json["user"]
        self.user = User(json: userJSON)
        self.message = json["message"].stringValue
    }
}
