//
//  Activities.swift
//  PetFor2SwiftUI
//
//  Created by Lucas Migge de Barros on 11/12/22.
//

import SwiftUI

struct ActivitiesView: View {
    var body: some View {
        VStack {
            Text("Atividades")
                .font(.title)
                .bold()
            
            Spacer()
        }
        .padding()
    }
    
}

struct Activities_Previews: PreviewProvider {
    static var previews: some View {
        ActivitiesView()
    }
}
