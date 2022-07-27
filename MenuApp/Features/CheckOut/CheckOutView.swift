//
//  CheckOutView.swift
//  MenuApp
//
//  Created by Mohamed Samir on 25/07/2022.
//

import SwiftUI

let cash = "Cash"
let credit = "Credit card"
let menuAppPoints = "App Points"

struct CheckOutView: View {
    @Environment(\.redactionReasons) var redactionReasons
    let bio = "The rain in Spain falls mainly on the Spaniards"


    let paymentTypes = [cash,credit,menuAppPoints]
    let tipsAmount = [10,15,20,25,30,50]
    
    @EnvironmentObject var order: Order
    @State private var selectedPaymentType = cash
    @State private var selectedTipAmount = 15
    @State private var addLoyaltyCard = false
    @State private var loyaltyNumber = ""
    @State private var showPaymentAlert = false
    
    var totalPrice :String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let total = Double(order.total)
        let tipValue = total / 100 * Double(selectedTipAmount)
        return formatter.string(from: NSNumber(value: total + tipValue )) ?? "0$"
    }
   
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?",selection: $selectedPaymentType){
                    ForEach(paymentTypes,id: \.self) { paymentType in
                        Text(paymentType)
                    }
                }
                Toggle("Add Menu App loyalty card ", isOn: $addLoyaltyCard.animation())
                if(addLoyaltyCard){
                    TextField("Enter your menu app card", text: $loyaltyNumber)
                }
            }
            
            
            Section(header: Text("Add a tip")){
                Picker("Percentage",selection: $selectedTipAmount.animation()){
                    ForEach(tipsAmount,id: \.self) {
                        Text("\($0)%").textContentType(.flightNumber)
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header:Text("Total \(totalPrice)%").font(.largeTitle)){
                Button("Confirm Order"){
                    showPaymentAlert.toggle()
                }
            }
            
        
           
          
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showPaymentAlert){
            Alert(title: Text("Order Confirmed"), message: Text("tour total price is : \(totalPrice)"),dismissButton: .default(Text("Ok")))
        }
    }
}

struct CheckOutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckOutView().environmentObject(Order())
    }
}
