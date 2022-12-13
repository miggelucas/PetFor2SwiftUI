//
//  ActivityRow.swift
//  PetFor2SwiftUI
//
//  Created by Lucas Migge de Barros on 11/12/22.
//

import SwiftUI

typealias handlerAction = (() -> ())

struct ActivityRow: View {
    @State var activity : Activity

    var actionMenu : handlerAction
    
    var body: some View {
        HStack(alignment: .center, spacing: 5){
            Button(action: {
                activity.teamButtonTapped(team: .orange)
            }) {
                Image(systemName: "moonphase.new.moon")
                    .foregroundColor(activity.orangeActive ? .orange : .gray)
            }
            
            Spacer()
            Menu(activity.name) {
                Button("Excluir atividade", role: .destructive) {
                 actionMenu()
                }
            }
            .font(.headline)
            .foregroundColor(.black)
            
            
            Spacer()
            
            Button(action: {
                activity.teamButtonTapped(team: .blue)
                
            }) {
                Image(systemName: "moonphase.new.moon")
                    .foregroundColor(activity.blueActive ? .blue : .gray)
            }
        }
        .padding()
    }
}

struct ActivityRow_Previews: PreviewProvider {
    static var activities = Activity.populate()
    static var previews: some View {
        ActivityRow(activity: activities[0], actionMenu: {})
    }
}
