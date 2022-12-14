//
//  SelectDaysOfWeek.swift
//  PetFor2SwiftUI
//
//  Created by Lucas Migge de Barros on 13/12/22.
//

import SwiftUI

struct SelectDaysOfWeek: View {
    @State var weekdays = Weekday.allCases
    
    @Binding var selectedItems : [Weekday]
    
    var body: some View {
        List {
            ForEach(weekdays, id : \.self) { weekday in
                Button {
                    withAnimation {
                        if selectedItems.contains(weekday) {
                            selectedItems.removeAll { $0 == weekday}
                        } else {
                            selectedItems.append(weekday)
                        }
                    }
                } label: {
                    HStack {
                        Text(weekday.rawValue)
                            .foregroundColor(.primary)
                            .font(.callout)
                        
                        Spacer()
                        
                        Image(systemName: "checkmark.circle")
                            .opacity(self.selectedItems.contains(weekday) ? 1.0 : 0.0)
                            .foregroundColor(.primary)
                        
                    }
                    .buttonStyle(.plain)
                    
                }
            }
        }
        .navigationTitle("Dias da semana")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SelectDaysOfWeek_Previews: PreviewProvider {
    static var previews: some View {
        SelectDaysOfWeek(selectedItems: .constant([.monday]))
    }
}
