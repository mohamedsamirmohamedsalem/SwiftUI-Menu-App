//
//  MenuAppApp.swift
//  MenuApp
//
//  Created by Mohamed Samir on 25/07/2022.
//

import SwiftUI

@main
struct MenuAppApp: App {
    
    @StateObject var order = Order()
    var body: some Scene {
        WindowGroup {
            OrderMenuView()
                .environmentObject(order)
        }
    }
}
