//
//  ItemRow.swift
//  MenuApp
//
//  Created by Mohamed Samir on 25/07/2022.
//

import SwiftUI

struct ItemRow: View {
    var item : MenuItem
    let colors : [String:Color] = ["D":.purple,"G":.black,"N":.red,"S":.blue,"V":.green]
    
    var body: some View {
        HStack {
            Image(item.thumbnailImage)
            VStack(alignment: .leading){
                Text(item.name)
                Text("$\(item.price)")
            }
            Spacer()
            ForEach(item.restrictions,id: \.self){ restriction in
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(5)
                    .background(colors[restriction])
                    .foregroundColor(.white)
                    .clipShape(Circle())
                
                                            
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: MenuItem.example)
    }
}
