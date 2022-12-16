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
        HStack(alignment: .center, spacing: 10){
            
            Image(systemName: "moonphase.new.moon")
                .foregroundColor(activity.orangeActive ? .orange : .gray)
                .onTapGesture {
                    activity.teamButtonTapped(team: .orange)
                }
            
            HStack {
                Spacer()
                
                Menu(activity.name) {
                    Button("Excluir atividade", role: .destructive) {
                        actionMenu()
                    }
                }
                .font(.headline)
                .foregroundColor(.primary)
                .multilineTextAlignment(.center)
                .padding()
               
                
                Spacer()
            }
            .overlay(
                RoundedRectangle(cornerRadius: 8).stroke(activity.activityColor(), lineWidth: 2)
            )
            
            Image(systemName: "moonphase.new.moon")
                .foregroundColor(activity.blueActive ? .blue : .gray)
                .onTapGesture {
                    activity.teamButtonTapped(team: .blue)
                }
            
        }
    }
}

struct ActivityRow_Previews: PreviewProvider {
    static var activities = Activity.populate()
    static var previews: some View {
        ActivityRow(activity: activities[0], actionMenu: {})
    }
}
