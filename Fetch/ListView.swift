//
//  ListView.swift
//  Fetch
//
//  Created by Kevin Hankes on 7/22/20.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var listViewModel: ListViewModel

    var body: some View {
        Form {
            Section(header: Text("Errors:")) {
                Text(listViewModel.errorText)
            }
            Section(header: Text("List ID One")) {
                List(listViewModel.listIdOne) { item in
                    ItemCell(item: item)
                }
            }
            Section(header: Text("List ID Two")) {
                List(listViewModel.listIdTwo) { item in
                    ItemCell(item: item)
                }
            }
            Section(header: Text("List ID Three")) {
                List(listViewModel.listIdThree) { item in
                    ItemCell(item: item)
                }
            }
            Section(header: Text("List ID Four")) {
                List(listViewModel.listIdFour) { item in
                    ItemCell(item: item)
                }
            }
        }.onAppear {
            self.listViewModel.fetchItems()
        }

    }
}

#if DEBUG
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(listViewModel: ListViewModel())
    }
}
#endif

/**
    A cell to display id, listId, and name in one horizontal row
 */
struct ItemCell: View {
    var item: ItemModel
    
    var body: some View {
        HStack {
            Text("id: \(item.id)")
            Spacer(minLength: 10)
            Text("listId: \(item.listId)")
            Spacer(minLength: 10)
            Text("name: \(item.name)")
        }.padding()
    }
}
