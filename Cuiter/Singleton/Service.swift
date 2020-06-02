//
//  Service.swift
//  Cuiter
//
//  Created by Chris Stev on 01/06/20.
//  Copyright © 2020 chrizstvan. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

class Service {
    
    static let instance = Service()
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    func fetchHome(completion: @escaping (HomeDataSource?, Error?) -> ()) {
        let request: APIRequest<HomeDataSource, JSONError> = tron.swiftyJSON.request("/twitter/home")
        
        request.perform(withSuccess: { (response) in
            print("successfully fetch our json objct")
            print(response.users.count)
            
            //self.datasource = response
            completion(response, nil)
            
        }) { (error) in
            completion(nil, error)
            print("failed to fetch JSON...", error)
        }
    }
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("json failed")
        }
    }
}
