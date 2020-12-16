//
//  BaseClassAPI.swift
//  FipeMVVM
//
//  Created by Taize Carminatti on 1/12/20.
//

import Foundation

class BaseClassAPI: NSObject {
    var id: String!
    var name: String!

    init(fromDictionary dictionary: [String: Any]) {
        id = dictionary["codigo"] as? String
        name = dictionary["nome"] as? String

        if id == nil {
            if let intId = dictionary["codigo"] as? Int {
                id = "\(intId)"
            }
        }
    }

}
