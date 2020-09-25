//
//  ItemModel.swift
//  Fetch
//
//  Created by Kevin Hankes on 7/22/20.
//

import Foundation
import SwiftyJSON

/**
    Model for the items returned by the API including the id, listId, and name
    Identifiable so it can be used in a list
    Comparable so it can be sorted
 */
class ItemModel: Identifiable, Comparable {
    public var id: Int = 0
    public var listId: Int = 0
    public var name: String = ""
    
    /**
        Identifiable property function
     */
    static func == (lhs: ItemModel, rhs: ItemModel) -> Bool {
        lhs.id == rhs.id
    }
    
    /**
        Comparable property function
     */
    static func < (lhs: ItemModel, rhs: ItemModel) -> Bool {
        if lhs.listId == rhs.listId {
            return lhs.name < rhs.name
        } else {
            return lhs.listId < rhs.listId
        }
    }
    
    /**
        Set item data from the json object
     */
    public func setItemData(fromJson json: JSON) {
        id = json["id"].intValue
        listId = json["listId"].intValue
        name = json["name"].stringValue
    }
}
