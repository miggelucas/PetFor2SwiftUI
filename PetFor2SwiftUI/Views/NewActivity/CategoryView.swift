//
//  CategoryView.swift
//  PetFor2SwiftUI
//
//  Created by Lucas Migge de Barros on 18/12/22.
//

import SwiftUI

struct CategoryView: View {
    @Binding var selection : Category
    
    var body: some View {
        Picker(selection: $selection) {
            ForEach(Category.allCases, id: \.self) { category in
                Text(category.rawValue)
            }
        } label: {
            Text("Categoria")
                .foregroundColor(.secondary)
        }
        
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(selection: .constant(Category.food))
    }
}
