//
//  OrderMenuView.swift
//  MenuApp
//
//  Created by Mohamed Samir on 25/07/2022.
//

import SwiftUI

struct OrderMenuView: View {
    var body: some View {
        TabView {
            MenuListView().tabItem {
                Label("Menu",systemImage: "list.dash")
            }
            OrderedView().tabItem {
                Label("Order",systemImage: "square.grid.3x2")
            }
        }
    }
}

struct OrderMenuView_Previews: PreviewProvider {
    static var previews: some View {
        OrderMenuView().environmentObject(Order())
    }
}
