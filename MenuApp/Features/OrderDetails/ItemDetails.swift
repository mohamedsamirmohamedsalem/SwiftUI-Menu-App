//
//  ItemDetails.swift
//  MenuApp
//
//  Created by Mohamed Samir on 25/07/2022.
//

import SwiftUI

struct ItemDetails: View {
    @EnvironmentObject var order : Order
    var item:MenuItem
    
    var body: some View {
        ScrollView{
            VStack{
                ZStack(alignment: .bottomTrailing) {
                    Image(item.thumbnailImage)
                        .resizable()
                        .scaledToFit()
                    Text("photo credit by : \(item.photoCredit)")
                        .padding(3)
                        .background(.black)
                        .foregroundColor(.white)
                        .font(.caption)
                        .offset(x: -5, y: -5)
                      
                }
                Text(item.description).padding()
                Spacer()
                Button("Oder now") {
                    order.add(item: item)
                }
                .font(.headline)
                .padding()
                .background(.white)
                .foregroundColor(.blue)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue,lineWidth: 1)
                .frame(width: 140, height: 50)
    )
                
                Spacer()
            }
            .navigationTitle(item.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ItemDetails_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ItemDetails(item: MenuItem.example).environmentObject(Order())
        }
    }
}
