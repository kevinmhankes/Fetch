//
//  ListViewModel.swift
//  Fetch
//
//  Created by Kevin Hankes on 7/22/20.
//

import Alamofire
import Combine
import Foundation
import SwiftyJSON
import SwiftUI

class ListViewModel: ObservableObject, Identifiable {
    /// Not used in the UI, but this would be used if we wanted to filter the listId's into their own list instead of relying on the assumed maximum of 4 as the highest listId
    @Published var fullList: [ItemModel] = []
    
    /// One list for each listId
    @Published var listIdOne: [ItemModel] = []
    @Published var listIdTwo: [ItemModel] = []
    @Published var listIdThree: [ItemModel] = []
    @Published var listIdFour: [ItemModel] = []
    
    /// Error text to display to the user when there is a request failure; blank when there is no error
    @Published var errorText: String = ""
    
    let url = URL(string: "https://fetch-hiring.s3.amazonaws.com/hiring.json")!
    
    /**
        Fetch item json from the requested URL using Alamofire
        Alamofire requests are done asynchronously through the main dispatch queue
        Validate() verifies that the response is in the 200s (success) or some other http status code (failure)
     */
    func fetchItems() {
        AF.request(url, method: .get, encoding: JSONEncoding.default).validate().responseJSON { response in
            switch response.result {
            case .success:
                let json = JSON(response.value as Any)
                self.addItemsToList(json: json)
            case .failure:
                self.errorText = "This is where we would take the error message from the API to display to the client or possibly retry depnding on the failure type"
            }
        }
    }
    
    /**
        Iterates through the json array, creates json objects as it loops, and appends each json object to the corresponding @Published list
        If the name is empty, then that means the name was listed as null or an empty string, which is what we want to filter out
        This is a quicker approach than using multiple filters over the full list to separate the lists and filter out the empty/null names
        Also, this function is run before the closure of the Alamofire request
     */
    func addItemsToList(json: JSON) {
        for (_, item) in json {
            let newItem = ItemModel()
            newItem.setItemData(fromJson: item)
            if !newItem.name.isEmpty {
                switch newItem.listId {
                case 1:
                    listIdOne.append(newItem)
                case 2:
                    listIdTwo.append(newItem)
                case 3:
                    listIdThree.append(newItem)
                case 4:
                    listIdFour.append(newItem)
                default:
                    fullList.append(newItem)
                }
            }
        }
        sortLists()
    }
    
    /**
        Sort lists based on the comparable function in the ItemModel
        This function is run before the closure of the Alamofire request
     */
    func sortLists() {
        listIdOne.sort()
        listIdTwo.sort()
        listIdThree.sort()
        listIdFour.sort()
    }
}
