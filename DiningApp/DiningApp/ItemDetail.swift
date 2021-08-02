//
//  ItemDetail.swift
//  iDine
//
//  Created by Rohit on 3/6/20.
//  Copyright © 2020 lumasecurity. All rights reserved.
//

import SwiftUI

struct ItemDetail: View {
    @EnvironmentObject var order : Order
    @State private var showingAlert = false
    @State private var orderPlaced = false

    var item : MenuItem
    var body: some View {
        VStack {
            ZStack (alignment: .bottomTrailing) {
                Image(item.mainImage)
                Text("Photo : \(item.photoCredit)")
                    .padding(4)
                    .font(.caption)
                    .background(Color.black)
                    .foregroundColor(Color.white)
                .offset(x: -5, y: -5)
            }
            Text(item.description)
            .padding()

            Button("Order this") {
                self.order.add(item: self.item)
                self.showingAlert = true
                self.orderPlaced = true
            }
            .disabled(orderPlaced)
            .padding()
            .font(.headline)
            .foregroundColor(Color.white)
            .background(orderPlaced ? .gray : Color.black)
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Added to Cart"), message: Text("Your order is added to cart"), dismissButton: .default(Text("Ok")))
            }
            Spacer()
        }.navigationBarTitle(Text(item.name), displayMode: .inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        NavigationView {
            ItemDetail(item: MenuItem.example).environmentObject(order)
        }
    }
}
