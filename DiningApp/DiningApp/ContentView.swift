//
//  ContentView.swift
//  iDine
//
//  Created by Rohit on 3/4/20.
//  Copyright © 2020 lumasecurity. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")

    var body: some View {
            NavigationView {
                List {
                    ForEach(menu) { section in
                        Section(header: Text(section.name)) {
                            ForEach(section.items) { menuItem in
                                ItemRow(item: menuItem)
                            }
                        }
                    }
                }.navigationBarTitle("Menu")
                    .listStyle(GroupedListStyle())
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
