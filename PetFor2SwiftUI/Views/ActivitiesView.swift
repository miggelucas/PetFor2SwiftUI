//
//  Activities.swift
//  PetFor2SwiftUI
//
//  Created by Lucas Migge de Barros on 11/12/22.
//

import SwiftUI

struct ActivitiesView: View {
    
    @State var activtiesList : [Activity] = Activity.populate()
 
    var body: some View {
        VStack {
            Text("Atividades")
                .font(.title)
                .bold()
            List(activtiesList) { list in
                /*@START_MENU_TOKEN@*/Text(list.name)/*@END_MENU_TOKEN@*/
            }

        }
        .padding()
    }
    
}

struct Activities_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesView()
    }
}
