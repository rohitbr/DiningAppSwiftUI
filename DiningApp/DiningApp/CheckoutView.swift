//
//  CheckoutView.swift
//  iDine
//
//  Created by Rohit on 3/7/20.
//  Copyright © 2020 lumasecurity. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order : Order
    static let paymentTypes = ["Cash", "Credit Card", "iDine Points"]
    static let tipAmounts = [10, 15,20,25]


    @State private var paymentType = 0
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 1
    @State private var showingAlert = false


    var totalPrice : Double {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(Self.tipAmounts[tipAmount])
        return total + tipValue
    }

    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay", selection: $paymentType) {
                    ForEach(0 ..< Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                    }
                }

                Toggle(isOn: $addLoyaltyDetails.animation()) {
                    Text("Add iDine Loyalty card")
                }

                if addLoyaltyDetails {
                    TextField("Enter your iDine id", text: $loyaltyNumber)
                }
            }
            Section(header: Text("Add a tip")) {
                Picker("Percentage", selection: $tipAmount) {
                    ForEach(0 ..< Self.tipAmounts.count) {
                        Text("\(Self.tipAmounts[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }

            Section(header: Text("\(totalPrice, specifier: "%.2f")")
                .font(.largeTitle)
            ) {
                Button("Confirm order") {
                    print("self howing alert before \(self.showingAlert)")
                    self.showingAlert.toggle()
                    print("self howing alert \(self.showingAlert)")
                }
            }
        }
        .navigationBarTitle(Text("Payment"), displayMode: .inline)
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Order Confirmed"), message: Text("Your total is $\(totalPrice, specifier: "%.2f") = thank you!"), dismissButton: .default(Text("Ok")))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}
