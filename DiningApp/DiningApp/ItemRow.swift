//
//  ItemRow.swift
//  iDine
//
//  Created by Rohit on 3/5/20.
//  Copyright © 2020 lumasecurity. All rights reserved.
//

import SwiftUI

struct TextView : View {
    static let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]

    var restriction : String
    var body: some View {
        Text(restriction)
            .font(.caption)
            .fontWeight(.black)
            .foregroundColor(.white)
            .padding(5)
            .background(Self.colors[restriction, default : .black])
            .clipShape(Circle())
    }
}

struct ItemRow: View {
    var item : MenuItem
    var body: some View {
        NavigationLink(destination: ItemDetail(item: item)) {
            HStack {
                Image(item.thumbnailImage)
                VStack (alignment: .leading, spacing: 5) {
                    Text(item.name)
                    Text("$ \(item.price)")
                }.layoutPriority(1)
                Spacer()
                ForEach(item.restrictions, id:  \.self) { restriction in
                    TextView(restriction: restriction)
                }
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
