//
//  OrderedView.swift
//  MenuApp
//
//  Created by Mohamed Samir on 25/07/2022.
//

import SwiftUI

struct OrderedView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach (order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                            
                        }
                    }.onDelete(perform: deleteItems)
                }
                
                Section {
                    NavigationLink(destination: CheckOutView()){
                        Text("Place Order")
                    }
                }.disabled(order.items.isEmpty)
            }
            .navigationTitle("Order")
            .listStyle(InsetGroupedListStyle())
            .toolbar {
                EditButton()
            }
        }
    }
    func deleteItems(at offsets: IndexSet){
        order.items.remove(atOffsets: offsets)
    }
}

struct OrderedView_Previews: PreviewProvider {
    static var previews: some View {
        OrderedView().environmentObject(Order())
    }
}
